import 'package:ex00/today.dart';
import 'package:ex00/week.dart';
import 'package:flutter/material.dart';
import 'current.dart';

void main() {
  runApp(Weather());
}

class Weather extends StatefulWidget {
  const Weather({super.key});

  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  int index = 0;
  final controller = PageController();
  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                const Icon(Icons.search, color: Colors.grey),
                const SizedBox(width: 10),
                // 3. Wrap TextField in Expanded to prevent layout errors
                Expanded(
                  child: TextField(
                    controller: search,
                    decoration: const InputDecoration(
                      hintText: "Search location...",
                      border: InputBorder.none, // Remove the default underline
                    ),
                    onSubmitted: (value) {
                      print("User searched for: $value");
                      // Add your search logic here
                    },
                  ),
                ),
                const SizedBox(width: 10),
                IconButton(
                  icon: Icon(Icons.location_on),
                  color: Colors.grey,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          currentIndex: index,
          onTap: (i) {
            setState(() => index = i);
            controller.animateToPage(
              i,
              duration: Duration(milliseconds: 250),
              curve: Curves.ease,
            );
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.wb_sunny),
              label: "Current",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.today), label: "Today"),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_view_week),
              label: "Weekly",
            ),
          ],
        ),
        body: PageView(
          controller: controller,
          onPageChanged: (i) => setState(() => index = i),
          children: const [Current(), Today(), Week()],
        ),
      ),
    );
  }
}
