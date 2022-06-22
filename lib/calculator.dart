// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  Widget numButton(String btnText, Color btnColor, Color txtColor) {
    return ElevatedButton(
      onPressed: () => {},
      style: ElevatedButton.styleFrom(
        fixedSize: Size(70, 70),
        shape: CircleBorder(),
        primary: btnColor,
      ),
      child: Text(
        btnText,
        style: TextStyle(
          fontSize: 25,
          color: txtColor,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size.width;
    if (screenSize < 500) {
      return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          toolbarHeight: 36,
          title: const Text("Calculator"),
          centerTitle: true,
          backgroundColor: Colors.black,
          titleTextStyle: const TextStyle(
            fontFamily: "MyriadPro",
            color: Colors.white,
            fontSize: 35,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 5,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      "0",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 80,
                      ),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  numButton("C", Colors.grey, Colors.black),
                  numButton("+/-", Colors.grey, Colors.black),
                  numButton("%", Colors.grey, Colors.black),
                  numButton("/", Colors.orange, Colors.white),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  numButton("7", Color.fromARGB(255, 49, 49, 49), Colors.white),
                  numButton("8", Color.fromARGB(255, 49, 49, 49), Colors.white),
                  numButton("9", Color.fromARGB(255, 49, 49, 49), Colors.white),
                  numButton("x", Colors.orange, Colors.white),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  numButton("4", Color.fromARGB(255, 49, 49, 49), Colors.white),
                  numButton("5", Color.fromARGB(255, 49, 49, 49), Colors.white),
                  numButton("6", Color.fromARGB(255, 49, 49, 49), Colors.white),
                  numButton("-", Colors.orange, Colors.white),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  numButton("1", Color.fromARGB(255, 49, 49, 49), Colors.white),
                  numButton("2", Color.fromARGB(255, 49, 49, 49), Colors.white),
                  numButton("3", Color.fromARGB(255, 49, 49, 49), Colors.white),
                  numButton("+", Colors.orange, Colors.white),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () => {},
                    style: ElevatedButton.styleFrom(
                      shape: StadiumBorder(),
                      primary: Color.fromARGB(255, 49, 49, 49),
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(28, 12, 90, 12),
                      child: Text(
                        "0",
                        style: TextStyle(
                          fontSize: 35,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  numButton(".", Color.fromARGB(255, 49, 49, 49), Colors.white),
                  numButton("=", Colors.orange, Colors.white),
                ],
              )
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          toolbarHeight: 36,
          title: const Text("Calculator"),
          centerTitle: true,
          backgroundColor: Colors.black,
          titleTextStyle: const TextStyle(
            fontFamily: "MyriadPro",
            color: Colors.white,
            fontSize: 35,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 5,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      "0",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 80,
                      ),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  numButton("C", Colors.grey, Colors.black),
                  SizedBox(
                    width: 25,
                  ),
                  numButton("+/-", Colors.grey, Colors.black),
                  SizedBox(
                    width: 25,
                  ),
                  numButton("%", Colors.grey, Colors.black),
                  SizedBox(
                    width: 25,
                  ),
                  numButton("/", Colors.orange, Colors.white),
                  SizedBox(
                    width: 25,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  numButton("7", Color.fromARGB(255, 49, 49, 49), Colors.white),
                  SizedBox(
                    width: 25,
                  ),
                  numButton("8", Color.fromARGB(255, 49, 49, 49), Colors.white),
                  SizedBox(
                    width: 25,
                  ),
                  numButton("9", Color.fromARGB(255, 49, 49, 49), Colors.white),
                  SizedBox(
                    width: 25,
                  ),
                  numButton("x", Colors.orange, Colors.white),
                  SizedBox(
                    width: 25,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  numButton("4", Color.fromARGB(255, 49, 49, 49), Colors.white),
                  SizedBox(
                    width: 25,
                  ),
                  numButton("5", Color.fromARGB(255, 49, 49, 49), Colors.white),
                  SizedBox(
                    width: 25,
                  ),
                  numButton("6", Color.fromARGB(255, 49, 49, 49), Colors.white),
                  SizedBox(
                    width: 25,
                  ),
                  numButton("-", Colors.orange, Colors.white),
                  SizedBox(
                    width: 25,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  numButton("1", Color.fromARGB(255, 49, 49, 49), Colors.white),
                  SizedBox(
                    width: 25,
                  ),
                  numButton("2", Color.fromARGB(255, 49, 49, 49), Colors.white),
                  SizedBox(
                    width: 25,
                  ),
                  numButton("3", Color.fromARGB(255, 49, 49, 49), Colors.white),
                  SizedBox(
                    width: 25,
                  ),
                  numButton("+", Colors.orange, Colors.white),
                  SizedBox(
                    width: 25,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => {},
                    style: ElevatedButton.styleFrom(
                      shape: StadiumBorder(),
                      primary: Color.fromARGB(255, 49, 49, 49),
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(28, 12, 90, 12),
                      child: Text(
                        "0",
                        style: TextStyle(
                          fontSize: 35,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  numButton(".", Color.fromARGB(255, 49, 49, 49), Colors.white),
                  SizedBox(
                    width: 25,
                  ),
                  numButton("=", Colors.orange, Colors.white),
                  SizedBox(
                    width: 25,
                  ),
                ],
              )
            ],
          ),
        ),
      );
    }
  }
}
