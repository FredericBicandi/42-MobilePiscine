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
  final controller = PageController();
  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.lightBlueAccent,
          elevation: 0,
          title: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                const Icon(Icons.search, color: Colors.white),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: search,
                    decoration: const InputDecoration(
                      hintText: "Search location...",
                      border: InputBorder.none,
                    ),
                    onSubmitted: (value) {
                      setState(() => output = value);
                    },
                  ),
                ),
                const SizedBox(width: 10),
                IconButton(
                  onPressed: () {
                    setState(() => output = "Geolocation");
                  },
                  icon: Icon(Icons.location_on),
                  color: Colors.white,
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
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.wb_sunny, color: Colors.yellow,),
              label: "Current",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.today,color: Colors.blue,), label: "Today"),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_view_week),
              label: "Weekly",
            ),
          ],
        ),
        body: PageView(
          controller: controller,
          onPageChanged: (i) => setState(() => index = i),
          children: [Current(), Today(), Week()],
        ),
      ),
    );
  }
}
