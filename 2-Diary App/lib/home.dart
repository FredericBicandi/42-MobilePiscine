import 'package:flutter/material.dart';
import 'AgendaPage.dart';
import 'profile.dart';
import 'AgendaPage.dart';

class DiaryHome extends StatefulWidget {
  const DiaryHome({super.key});

  @override
  State<DiaryHome> createState() => _DiaryHomeState();
}

class _DiaryHomeState extends State<DiaryHome> {
  int index = 0;

  final pages = [
    ProfilePage(),
    AgendaPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (i) => setState(() => index = i),

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_outlined),
            label: "",
          ),
        ],

        selectedItemColor: Color(0xFF8EA12F),
        unselectedItemColor: Colors.black54,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }
}
