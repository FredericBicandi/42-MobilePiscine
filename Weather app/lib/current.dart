import 'package:flutter/material.dart';
import 'logic.dart';

class Current extends StatelessWidget {
  final Map<String, dynamic>? weatherData;
  final List? location;
  final String description;

  const Current({
    super.key,
    required this.weatherData,
    required this.location,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    if (err != true && weatherData == null) return Center(child: Text(""));
    return Column(
      children: [
        err
            ? Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  result,
                  style: TextStyle(fontSize: 12, color: Colors.red),
                ),
              )
            : SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 120),
                    ?getSafe(location!, 3) != ""
                        ? Text(
                            "${getSafe(location!, 3)}, ${getSafe(location!, 4)}",
                            style: TextStyle(
                              fontSize: 18,
                              color: afterNoon
                                  ? const Color(0xFF5A3A1E)
                                  : Colors.orangeAccent,
                            ),
                          )
                        : null,
                    Text(
                      getSafe(location!, 1),
                      style: TextStyle(
                        fontSize: 18,
                        color: afterNoon
                            ? const Color(0xFF5A3A1E)
                            : Colors.white,
                      ),
                    ),
                    Text(
                      getSafe(location!, 2),
                      style: TextStyle(
                        fontSize: 18,
                        color: afterNoon
                            ? const Color(0xFF5A3A1E)
                            : Colors.white,
                      ),
                    ),
                    SizedBox(height: 150),
                    Text(
                      "${weatherData!["current_weather"]["temperature"]}°C",
                      style: TextStyle(
                        fontSize: 42,
                        color: afterNoon
                            ? const Color(0xFF5A3A1E)
                            : Colors.white,
                      ),
                    ),
                    SizedBox(height: 50),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 42,
                        color: afterNoon
                            ? const Color(0xFF5A3A1E)
                            : Colors.white,
                      ),
                    ),
                    Icon(
                      (description == "Clear")
                          ? Icons.wb_sunny_rounded
                          : (description == "Cloudy")
                          ? Icons.cloud_rounded
                          : (description == "Fog")
                          ? Icons.foggy
                          : (description == "Rain")
                          ? Icons.grain_rounded
                          : (description == "Snowfall")
                          ? Icons.cloudy_snowing
                          : (description == "Thunderstorm")
                          ? Icons.thunderstorm_rounded
                          : Icons.sunny_snowing,
                      color: afterNoon
                          ? const Color(0xFF5A3A1E)
                          : Colors.orangeAccent,
                      size: 80,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.waves,
                          color: afterNoon
                              ? const Color(0xFF5A3A1E)
                              : Colors.white,
                        ),
                        SizedBox(width: 10),
                        Text(
                          "${weatherData!["current_weather"]["windspeed"] as double} km/h",
                          style: TextStyle(
                            fontSize: 18,
                            color: afterNoon
                                ? const Color(0xFF5A3A1E)
                                : Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
      ],
    );
  }
}
