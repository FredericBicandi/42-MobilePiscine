import 'package:ex00/logic.dart';
import 'package:flutter/material.dart';


class Today extends StatefulWidget {
  const Today({super.key});

  @override
  State<Today> createState() => _TodayState();
}

class _TodayState extends State<Today> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Today",style: TextStyle(fontSize: 42),),
          Text(cityName!,style: TextStyle(fontSize: 42),),
        ],
      ),
    );
  }
}
