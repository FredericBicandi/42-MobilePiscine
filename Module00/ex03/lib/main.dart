import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

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
  late String equation = "0";
  late String result = "0";
  double displayEquation = 42;
  double displayResult = 24;

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
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Wrap(
              alignment: WrapAlignment.end,
              children: [
                AnimatedDefaultTextStyle(
                  duration: const Duration(milliseconds: 200),
                  style: TextStyle(
                    fontFamily: "Times New Roman",
                    fontSize: displayEquation,
                    color: Colors.black,
                  ),
                  child: Text(equation),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Wrap(
              alignment: WrapAlignment.end,
              children: [
                AnimatedDefaultTextStyle(
                  duration: const Duration(milliseconds: 200),
                  style: TextStyle(
                    fontFamily: "Times New Roman",
                    fontSize: displayResult,
                    color: Colors.black,
                  ),
                  child: Text(result),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
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
                          onPressed: () => setState(() {
                            equation == "0"
                                ? equation = "7"
                                : equation = "${equation}7";
                            displayEquation = 42;
                            displayResult = 24;
                          }),
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.teal,
                          ),
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
                          onPressed: () => setState(() {
                            equation == "0"
                                ? equation = "8"
                                : equation = "${equation}8";
                            displayEquation = 42;
                            displayResult = 24;
                          }),
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.teal,
                          ),
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
                          onPressed: () => setState(() {
                            equation == "0"
                                ? equation = "9"
                                : equation = "${equation}9";
                            displayEquation = 42;
                            displayResult = 24;
                          }),
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.teal,
                          ),
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
                          onPressed: () {
                            setState(() {
                              equation == "0"
                                  ? null
                                  : equation = equation.substring(
                                      0,
                                      equation.length - 1,
                                    );
                              displayEquation = 42;
                              displayResult = 24;
                            });
                            equation.isEmpty
                                ? setState(() => equation = "0")
                                : null;
                          },
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
                          onPressed: () => setState(() {
                            if (equation == "0") return;
                            equation == "0" ? null : equation = "0";
                            result == "0" ? null : result = "0";
                            displayEquation = 42;
                            displayResult = 24;
                          }),
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
                          onPressed: () => setState(() {
                            equation == "0"
                                ? equation = "4"
                                : equation = "${equation}4";
                            displayEquation = 42;
                            displayResult = 24;
                          }),
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.teal,
                          ),
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
                          onPressed: () => setState(() {
                            equation == "0"
                                ? equation = "5"
                                : equation = "${equation}5";
                            displayEquation = 42;
                            displayResult = 24;
                          }),
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.teal,
                          ),
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
                          onPressed: () => setState(() {
                            equation == "0"
                                ? equation = "6"
                                : equation = "${equation}6";
                            displayEquation = 42;
                            displayResult = 24;
                          }),
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.teal,
                          ),
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
                          onPressed: () => setState(() {
                            equation == "0" ? null : equation = "$equation+";
                            displayEquation = 42;
                            displayResult = 24;
                          }),
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
                          onPressed: () => setState(() {
                            equation == "0"
                                ? equation = "-"
                                : equation = "$equation-";
                            displayEquation = 42;
                            displayResult = 24;
                          }),
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
                          onPressed: () => setState(() {
                            equation == "0"
                                ? equation = "1"
                                : equation = "${equation}1";
                            displayEquation = 42;
                            displayResult = 24;
                          }),
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.teal,
                          ),
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
                          onPressed: () => setState(() {
                            equation == "0"
                                ? equation = "2"
                                : equation = "${equation}2";
                            displayEquation = 42;
                            displayResult = 24;
                          }),
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.teal,
                          ),
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
                          onPressed: () => setState(() {
                            equation == "0"
                                ? equation = "3"
                                : equation = "${equation}3";
                            displayEquation = 42;
                            displayResult = 24;
                          }),
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.teal,
                          ),
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
                          onPressed: () => setState(() {
                            equation == "0" ? null : equation = "${equation}x";
                            displayEquation = 42;
                            displayResult = 24;
                          }),
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
                          onPressed: () => setState(() {
                            equation == "0" ? null : equation = "${equation}/";
                            displayEquation = 42;
                            displayResult = 24;
                          }),
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
                          onPressed: () => setState(() {
                            equation == "0"
                                ? equation = "0"
                                : equation = "${equation}0";
                            displayEquation = 42;
                            displayResult = 24;
                          }),
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.teal,
                          ),
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
                          onPressed: () => setState(() {
                            equation == "0"
                                ? equation = "."
                                : equation = "$equation.";
                            displayEquation = 42;
                            displayResult = 24;
                          }),
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.teal,
                          ),
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
                          onPressed: () => setState(() {
                            equation == "0"
                                ? equation = "00"
                                : equation = "${equation}00";
                            displayEquation = 42;
                            displayResult = 24;
                          }),
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.teal,
                          ),
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
                          onPressed: () {
                            // Invalid ending
                            if (equation.endsWith('+') ||
                                equation.endsWith('-') ||
                                equation.endsWith('x') ||
                                equation.endsWith('/')) {
                              setState(() {
                                result = "Math error";
                                displayResult = 42;
                                displayEquation = 24;
                              });
                              return;
                            }

                            try {
                              String finalInput = equation.replaceAll('x', '*');

                              Parser p = Parser();
                              Expression exp = p.parse(finalInput);

                              double value = exp.evaluate(
                                EvaluationType.REAL,
                                ContextModel(),
                              );

                              setState(() {
                                result = value.toString();
                                displayEquation = 24;
                                displayResult = 42;
                              });
                            } catch (e) {
                              setState(() {
                                result = "Math error";
                                displayResult = 42;
                                displayEquation = 24;
                              });
                            }
                          },
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
        ],
      ),
    );
  }
}
