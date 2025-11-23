import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'logic.dart';

class Today extends StatelessWidget {
  final Map<String, dynamic>? weatherData;
  final List? location;
  final String description;

  const Today({
    super.key,
    required this.weatherData,
    required this.location,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    if (weatherData == null) {
      return Center(
        child: Text("No data", style: TextStyle(color: Colors.white)),
      );
    }

    final hourly = weatherData!["hourly"];
    var times = List<String>.from(hourly["time"]);
    List<String> today = [];
    for (int i = 0; i <= 23; i++) today.add(times[i]);
    times = today;
    final temps = List<double>.from(hourly["temperature_2m"]);
    final winds = List<double>.from(hourly["windspeed_10m"]);

    return Column(
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
            color: afterNoon ? const Color(0xFF5A3A1E) : Colors.white,
          ),
        ),
        Text(
          getSafe(location!, 2),
          style: TextStyle(
            fontSize: 18,
            color: afterNoon ? const Color(0xFF5A3A1E) : Colors.white,
          ),
        ),
        SizedBox(height: 60),
        Text(
          "Today Tempratures",
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
        SizedBox(width: 490, child: TodayChart(hourly: hourly)),
        SizedBox(height: 60),
        SizedBox(
          height: 180,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: times.length,
            itemBuilder: (context, i) {
              final hour = times[i].split("T")[1].substring(0, 5); // "14:00"
              final temp = temps[i];
              final wind = winds[i];

              return Container(
                width: 100,
                margin: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.25),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(hour, style: TextStyle(color: Colors.white70)),
                    SizedBox(height: 8),
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
                      size: 24,
                    ),
                    // or map by code
                    SizedBox(height: 8),
                    Text(
                      "$temp°C",
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.air, color: Colors.white70, size: 14),
                        SizedBox(width: 4),
                        Text(
                          "${wind}km/h",
                          style: TextStyle(color: Colors.white70, fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class TodayChart extends StatelessWidget {
  final Map<String, dynamic> hourly;

  const TodayChart({super.key, required this.hourly});

  @override
  Widget build(BuildContext context) {
    final times = hourly["time"]; // ["2025-02-03T00:00", ...]
    final temps = hourly["temperature_2m"]; // [12.3, 11.8, ...]
    final minTemp = temps.reduce((a, b) => a < b ? a : b) - 1;
    final maxTemp = temps.reduce((a, b) => a > b ? a : b) + 1;
    final List<FlSpot> spots = [];

    for (int i = 0; i <= 21; i += 3) {
      final hour = int.parse(times[i].split("T")[1].split(":")[0]);
      final temp = temps[i].toDouble();
      spots.add(FlSpot(hour.toDouble(), temp));
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        height: 250,
        child: LineChart(
          LineChartData(
            minY: minTemp,
            maxY: maxTemp,
            minX: 0,
            maxX: 21,
            borderData: FlBorderData(show: false),
            gridData: FlGridData(show: false),

            titlesData: FlTitlesData(
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 30,
                  getTitlesWidget: (value, _) => Text(
                    "${value.toInt()}°",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
              ),
              rightTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  interval: 3,
                  getTitlesWidget: (value, _) => Text(
                    "${value.toInt().toString().padLeft(2, '0')}:00",
                    style: TextStyle(color: Colors.white70, fontSize: 11),
                  ),
                ),
              ),
            ),
            // borderData: FlBorderData(show: true),
            lineBarsData: [
              LineChartBarData(
                spots: spots,
                isCurved: true,
                barWidth: 2,
                color: Colors.orangeAccent,

                dotData: FlDotData(
                  show: true,
                  getDotPainter: (spot, percent, bar, index) =>
                      FlDotCirclePainter(radius: 3, color: Colors.white70),
                ),
                aboveBarData: BarAreaData(
                  show: true,
                  color: Colors.black54.withOpacity(0.04),
                ),
                belowBarData: BarAreaData(
                  show: true,
                  color: Colors.orangeAccent.withOpacity(0.2),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
