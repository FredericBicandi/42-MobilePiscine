import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const Ex01(),
    );
  }
}

class Ex01 extends StatefulWidget {
  const Ex01({super.key});

  @override
  State<Ex01> createState() => _Ex01State();
}

class _Ex01State extends State<Ex01> {
  String _text = " A  simple text ";
  bool _ispressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blue,
              ),
              child: Text(
                _text,
                style: TextStyle(fontSize: 42, color: Colors.white),
              ),
            ),
            SizedBox(height: 5),
            ElevatedButton(
              onPressed: () {
                _ispressed = !_ispressed;
                _ispressed
                    ? setState(() => _text = " Hello World ")
                    : setState(() => _text = " A  simple text ");
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white70),
              child: const Text(
                "Click me",
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
