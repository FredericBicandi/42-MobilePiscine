import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(useMaterial3: false),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.teal,
        title: Center(
          child: Text(
            "Calculator",
            style: TextStyle(
              fontFamily: "comic sans",
              fontSize: 25,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Container(
                color: Colors.grey.withOpacity(0.1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      children: [
                        Text(
                          "0",
                          style: TextStyle(
                            fontFamily: "Times New Roman",
                            fontSize: 42,
                          ),
                        ),Text(
                          "0",
                          style: TextStyle(
                            fontFamily: "Times New Roman",
                            fontSize: 24,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.teal, width: 0.1),
                    ),
                    child: TextButton(
                      onPressed: () => kDebugMode ? print("7") : null,
                      style: TextButton.styleFrom(foregroundColor: Colors.teal),
                      child: const Text(
                        "7",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.teal, width: 0.1),
                    ),
                    child: TextButton(
                      onPressed: () => kDebugMode ? print("8") : null,
                      style: TextButton.styleFrom(foregroundColor: Colors.teal),
                      child: const Text(
                        "8",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.teal, width: 0.1),
                    ),
                    child: TextButton(
                      onPressed: () => kDebugMode ? print("9") : null,
                      style: TextButton.styleFrom(foregroundColor: Colors.teal),
                      child: const Text(
                        "9",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Colors.red.withOpacity(0.3),
                      border: Border.all(
                        color: Colors.red.withOpacity(0.3),
                        width: 0.1,
                      ),
                    ),
                    child: TextButton(
                      onPressed: () => kDebugMode ? print("C") : null,
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.red.withOpacity(0.3),
                      ),
                      child: const Text(
                        "C",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Colors.red.withOpacity(0.3),
                      border: Border(
                        left: BorderSide(
                          color: Colors.red.withOpacity(0.3),
                          width: 0.1,
                        ),
                        bottom: BorderSide(
                          color: Colors.red.withOpacity(0.3),
                          width: 0.1,
                        ),
                      ),
                      // border: Border.all(color: Colors.red.withOpacity(0.3), width: 0.1),
                    ),
                    child: TextButton(
                      onPressed: () => kDebugMode ? print("AC") : null,
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.red.withOpacity(0.3),
                      ),
                      child: const Text(
                        "AC",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.teal, width: 0.1),
                    ),
                    child: TextButton(
                      onPressed: () => kDebugMode ? print("4") : null,
                      style: TextButton.styleFrom(foregroundColor: Colors.teal),
                      child: const Text(
                        "4",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.teal, width: 0.1),
                    ),
                    child: TextButton(
                      onPressed: () => kDebugMode ? print("5") : null,
                      style: TextButton.styleFrom(foregroundColor: Colors.teal),
                      child: const Text(
                        "5",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.teal, width: 0.1),
                    ),
                    child: TextButton(
                      onPressed: () => kDebugMode ? print("6") : null,
                      style: TextButton.styleFrom(foregroundColor: Colors.teal),
                      child: const Text(
                        "6",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Colors.teal.withOpacity(0.3),
                      border: Border.all(
                        color: Colors.teal.withOpacity(0.3),
                        width: 0.1,
                      ),
                    ),
                    child: TextButton(
                      onPressed: () => kDebugMode ? print("+") : null,
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.teal.withOpacity(0.3),
                      ),
                      child: const Text(
                        "+",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Colors.teal.withOpacity(0.3),
                      border: Border.all(
                        color: Colors.teal.withOpacity(0.3),
                        width: 0.1,
                      ),
                    ),
                    child: TextButton(
                      onPressed: () => kDebugMode ? print("-") : null,
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.teal.withOpacity(0.3),
                      ),
                      child: const Text(
                        "-",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.teal, width: 0.1),
                    ),
                    child: TextButton(
                      onPressed: () => kDebugMode ? print("1") : null,
                      style: TextButton.styleFrom(foregroundColor: Colors.teal),
                      child: const Text(
                        "1",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.teal, width: 0.1),
                    ),
                    child: TextButton(
                      onPressed: () => kDebugMode ? print("2") : null,
                      style: TextButton.styleFrom(foregroundColor: Colors.teal),
                      child: const Text(
                        "2",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.teal, width: 0.1),
                    ),
                    child: TextButton(
                      onPressed: () => kDebugMode ? print("3") : null,
                      style: TextButton.styleFrom(foregroundColor: Colors.teal),
                      child: const Text(
                        "3",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Colors.teal.withOpacity(0.3),
                      border: Border.all(
                        color: Colors.teal.withOpacity(0.3),
                        width: 0.1,
                      ),
                    ),
                    child: TextButton(
                      onPressed: () => kDebugMode ? print("x") : null,
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.teal.withOpacity(0.3),
                      ),
                      child: const Text(
                        "x",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Colors.teal.withOpacity(0.3),
                      border: Border.all(
                        color: Colors.teal.withOpacity(0.3),
                        width: 0.1,
                      ),
                    ),
                    child: TextButton(
                      onPressed: () => kDebugMode ? print("/") : null,
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.teal.withOpacity(0.3),
                      ),
                      child: const Text(
                        "/",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.teal, width: 0.1),
                    ),
                    child: TextButton(
                      onPressed: () => kDebugMode ? print("0") : null,
                      style: TextButton.styleFrom(foregroundColor: Colors.teal),
                      child: const Text(
                        "0",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.teal, width: 0.1),
                    ),
                    child: TextButton(
                      onPressed: () => kDebugMode ? print(".") : null,
                      style: TextButton.styleFrom(foregroundColor: Colors.teal),
                      child: const Text(
                        ".",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.teal, width: 0.1),
                    ),
                    child: TextButton(
                      onPressed: () => kDebugMode ? print("00") : null,
                      style: TextButton.styleFrom(foregroundColor: Colors.teal),
                      child: const Text(
                        "00",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Colors.teal.withOpacity(0.3),
                      border: Border.all(
                        color: Colors.teal.withOpacity(0.3),
                        width: 0.1,
                      ),
                    ),
                    child: TextButton(
                      onPressed: () => kDebugMode ? print("=") : null,
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.teal.withOpacity(0.3),
                      ),
                      child: const Text(
                        "=",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Colors.teal.withOpacity(0.3),
                      border: Border.all(
                        color: Colors.teal.withOpacity(0.3),
                        width: 0.1,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
