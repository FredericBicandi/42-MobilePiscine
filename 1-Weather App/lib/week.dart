import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'logic.dart';

class Week extends StatelessWidget {
  final Map<String, dynamic>? weatherData;
  final List? location;
  final String description;

  const Week({
    super.key,
    required this.weatherData,
    required this.location,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    if (weatherData == null) return Center(child: Text("No Data"));

    final daily = weatherData!["daily"];
    final List dates = daily["time"];
    final List minTemps = daily["temperature_2m_min"];
    final List maxTemps = daily["temperature_2m_max"];

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
          "Weekly Tempratures",
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: WeeklyChart(
            dates: dates,
            minTemps: minTemps,
            maxTemps: maxTemps,
          ),
        ),

        SizedBox(height: 60),
        SizedBox(
          height: 180,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: dates.length,
            itemBuilder: (context, i) {
              return Container(
                width: 110,
                margin: EdgeInsets.symmetric(horizontal: 8),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.25),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      dates[i],
                      style: TextStyle(color: Colors.white70, fontSize: 15),
                    ),
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
                    SizedBox(height: 8),
                    Text(
                      "${maxTemps[i]}°C",
                      style: TextStyle(
                        color: Colors.redAccent,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "${minTemps[i]}°C",
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
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

class WeeklyChart extends StatelessWidget {
  final List dates;
  final List minTemps;
  final List maxTemps;

  const WeeklyChart({
    super.key,
    required this.dates,
    required this.minTemps,
    required this.maxTemps,
  });

  @override
  Widget build(BuildContext context) {
    final List<FlSpot> maxSpots = [];
    final List<FlSpot> minSpots = [];

    for (int i = 0; i < maxTemps.length; i++) {
      maxSpots.add(FlSpot(i.toDouble(), maxTemps[i].toDouble()));
      minSpots.add(FlSpot(i.toDouble(), minTemps[i].toDouble()));
    }

    final double minY = minTemps.reduce((a, b) => a < b ? a : b).toDouble() - 2;
    final double maxY = maxTemps.reduce((a, b) => a > b ? a : b).toDouble() + 2;

    return SizedBox(
      height: 250,
      child: LineChart(
        LineChartData(
          minX: 0,
          maxX: (dates.length - 1).toDouble(),
          minY: minY,
          maxY: maxY,

          gridData: FlGridData(show: true, drawVerticalLine: false),
          borderData: FlBorderData(
            show: true,
            border: Border.all(color: Colors.white38),
          ),
          titlesData: FlTitlesData(
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                interval: 6,
                showTitles: true,
                getTitlesWidget: (value, _) => Text(
                  "${value.toInt()}°",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 1,
                getTitlesWidget: (value, _) {
                  int i = value.toInt();
                  if (i < 0 || i >= dates.length) return Container();
                  return Text(
                    dates[i].split("-")[2],
                    style: TextStyle(color: Colors.white70, fontSize: 10),
                  );
                },
              ),
            ),
          ),

          lineBarsData: [
            /// RED LINE (Max temps)
            LineChartBarData(
              spots: maxSpots,
              isCurved: true,
              barWidth: 3,
              color: Colors.redAccent,
              dotData: FlDotData(
                show: true,
                getDotPainter: (spot, percent, bar, index) =>
                    FlDotCirclePainter(
                      radius: 4,
                      color: Colors.redAccent,
                      strokeWidth: 0,
                    ),
              ),
            ),

            /// BLUE LINE (Min temps)
            LineChartBarData(
              spots: minSpots,
              isCurved: true,
              barWidth: 3,
              color: Colors.blueAccent,
              dotData: FlDotData(
                show: true,
                getDotPainter: (spot, percent, bar, index) =>
                    FlDotCirclePainter(
                      radius: 4,
                      color: Colors.blueAccent,
                      strokeWidth: 0,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
