import 'package:ex00/today.dart';
import 'package:ex00/week.dart';
import 'package:flutter/material.dart';
import 'current.dart';
import 'logic.dart';

void main() => runApp(Weather());

class Weather extends StatefulWidget {
  const Weather({super.key});

  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  int index = 0;
  late String image;
  final controller = PageController();
  dynamic location;
  String description = "";
  final today = DateTime.now().toString().split(" ")[1];
  Map<String, dynamic>? weatherData;
  Map<String, dynamic>? todayWeatherData;
  Map<String, dynamic>? weeklyWeatherData;
  double? lat;
  double? lon;

  Future<void> loadLocation() async {
    final res = await LocationService.getCurrentPosition();

    if (res.success) {
      setState(() {
        lat = res.latitude;
        lon = res.longitude;
      });
    } else {
      setState(() {
        err = true;
        result = res.errorMessage ?? "Unknown error";
      });
    }
  }

  void currentPage(dynamic city) async {
    if (err) {
      setState(() => err = false);
    }
    double lat = double.parse(city["lat"]);
    double lon = double.parse(city["lon"]);

    final data = await API.getWeather(lat, lon);

    setState(() {
      weatherData = data;
      suggestions = [];
      if (city != null) {
        if (search.text.isNotEmpty) {
          search.text = city["display_name"];
        }
        location = city["display_name"].split(",");
      } else {
        search.text = "Your location";
        location = ["", "", "", ""];
      }
    });

    int code = weatherData!["current_weather"]["weathercode"];
    description = weatherDescriptions[code] ?? "Unknown";
  }

  void todayPage(dynamic city) async {
    final lat = double.parse(city["lat"]);
    final lon = double.parse(city["lon"]);

    final hourly = await API.getHourly(lat, lon);

    setState(() => todayWeatherData = hourly);

    location = city["display_name"].split(",");

    final codes = hourly?["hourly"]?["weathercode"] ?? [];
    final int code = codes.isNotEmpty ? codes[0] : 0;

    description = weatherDescriptions[code] ?? "Unknown";
  }

  void weeklyPage(dynamic city) async {
    final lat = double.parse(city["lat"]);
    final lon = double.parse(city["lon"]);

    final weekly = await API.getWeekly(lat, lon);

    setState(() => weeklyWeatherData = weekly);
  }

  Future<void> loadWeatherData(dynamic city) async {
    currentPage(city);
    todayPage(city);
    weeklyPage(city);
  }

  @override
  void initState() {
    super.initState();

    int hour = int.parse(DateTime.now().hour.toString());
    if (hour >= 5 && hour < 21) {
      afterNoon = true;
      image = "AfterNoon.png";
    } else {
      afterNoon = false;
      image = "Night.png";
    }

    loadInfo();
  }

  Future<void> loadInfo() async {
    late final dynamic geo;
    await loadLocation();
    if (lat == null && lon == null) return;
    geo = await API.reverseGeocode(lat!, lon!);

    if (geo != null) {
      final city = {
        "lat": geo["lat"],
        "lon": geo["lon"],
        "display_name": geo["display_name"],
        "address": geo["address"],
      };
      loadWeatherData(city);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: Row(
              children: [
                isLoading
                    ? SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 3,
                          color: afterNoon
                              ? const Color(0xFF5A3A1E)
                              : Colors.white,
                        ),
                      )
                    : Icon(
                        Icons.search,
                        color: afterNoon
                            ? const Color(0xFF5A3A1E)
                            : Colors.white,
                      ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: search,
                    style: TextStyle(
                      color: afterNoon ? Color(0xFF5A3A1E) : Colors.white,
                    ),
                    cursorColor: afterNoon ? Color(0xFF5A3A1E) : Colors.white,
                    decoration: InputDecoration(
                      hintText: "Search for a city",
                      hintStyle: TextStyle(
                        color: afterNoon
                            ? const Color(0xFF5A3A1E)
                            : Colors.white,
                      ),
                      border: InputBorder.none,
                    ),
                    onChanged: (value) async {
                      if (value.isEmpty) {
                        setState(() {
                          suggestions = [];
                          isLoading = false;
                        });
                        return;
                      }

                      setState(() => isLoading = true);

                      final currentQuery = value;
                      final data = await API.searchCities(value);

                      if (search.text != currentQuery) {
                        return;
                      }

                      setState(() {
                        suggestions = data;
                        isLoading = false;
                      });
                    },
                  ),
                ),
                const SizedBox(width: 10),
                IconButton(
                  onPressed: () async => await loadInfo(),
                  icon: Icon(
                    Icons.location_on,
                    color: afterNoon ? Color(0xFFB86E2A) : Colors.orangeAccent,
                    size: 30,
                  ),
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          unselectedItemColor: afterNoon ? Color(0xFF5A3A1E) : Colors.white70,
          selectedItemColor: afterNoon
              ? Color(0xFFB86E2A)
              : Colors.orangeAccent,
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
          currentIndex: index,
          onTap: (i) {
            setState(() => index = i);
            controller.animateToPage(
              i,
              duration: Duration(milliseconds: 250),
              curve: Curves.ease,
            );
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.wb_sunny_outlined,
                color: afterNoon ? Color(0xFF7E552A) : Colors.white70,
              ),
              label: "Current",
              activeIcon: Icon(
                Icons.wb_sunny,
                color: afterNoon ? Color(0xFFB86E2A) : Colors.orangeAccent,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.today_outlined,
                color: afterNoon ? Color(0xFF7E552A) : Colors.white70,
              ),
              label: "Today",
              activeIcon: Icon(
                Icons.today,
                color: afterNoon ? Color(0xFFB86E2A) : Colors.orangeAccent,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.calendar_view_week_outlined,
                color: afterNoon ? Color(0xFF7E552A) : Colors.white70,
              ),
              label: "Weekly",
              activeIcon: Icon(
                Icons.calendar_view_week,
                color: afterNoon ? Color(0xFFB86E2A) : Colors.orangeAccent,
              ),
            ),
          ],
        ),
        body: Stack(
          children: [
            Image.asset(
              "assets/$image",
              fit: BoxFit.fill,
              width: double.infinity,
              height: double.infinity,
            ),
            Positioned.fill(child: Container(color: const Color(0x20000000))),
            Positioned.fill(
              child: suggestions.isNotEmpty
                  ? ListView.builder(
                      itemCount: suggestions.length,
                      itemBuilder: (context, index) {
                        final city = suggestions[index];

                        final cityName =
                            city["address"]?["city"] ??
                            city["display_name"] ??
                            "Unknown";

                        final region = city["address"]?["state"] ?? "";
                        final country = city["address"]?["country"] ?? "";

                        return ListTile(
                          leading: Icon(
                            Icons.location_city,
                            color: afterNoon
                                ? const Color(0xFFB86E2A)
                                : Colors.orangeAccent,
                          ),
                          title: Text(
                            cityName,
                            style: TextStyle(
                              color: afterNoon
                                  ? Color(0xFF5A3A1E)
                                  : Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            "$region, $country",
                            style: TextStyle(
                              color: afterNoon
                                  ? Color(0xFF5A3A1E)
                                  : Colors.white70,
                            ),
                          ),
                          onTap: () => loadWeatherData(city),
                        );
                      },
                    )
                  : PageView(
                      controller: controller,
                      onPageChanged: (i) => setState(() => index = i),
                      children: [
                        Current(
                          weatherData: weatherData,
                          location: location,
                          description: description,
                        ),
                        Today(
                          weatherData: todayWeatherData,
                          location: location,
                          description: description,
                        ),
                        Week(
                          weatherData: weeklyWeatherData,
                          location: location,
                          description: description,
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
