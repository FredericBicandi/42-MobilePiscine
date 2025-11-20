import 'package:flutter/material.dart';


class Week extends StatefulWidget {
  const Week({super.key});

  @override
  State<Week> createState() => _WeekState();
}

class _WeekState extends State<Week> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Weekly",style: TextStyle(fontSize: 42),),
        ],
      ),
    );
  }
}
