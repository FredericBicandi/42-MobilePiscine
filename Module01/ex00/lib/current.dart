import 'package:flutter/material.dart';


class Current extends StatefulWidget {
  const Current({super.key});

  @override
  State<Current> createState() => _CurrentState();
}

class _CurrentState extends State<Current> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Currently",style: TextStyle(fontSize: 42),),
          Text("Beirut",style: TextStyle(fontSize: 42),),
        ],
      ),
    );
  }
}
