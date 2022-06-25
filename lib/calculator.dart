// ignore_for_file: prefer_const_constructors

import 'package:google_fonts/google_fonts.dart';
import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  dynamic displaytxt = 20;
  dynamic finalResult = '';
  double numOne = 0;
  double numTwo = 0;
  String oldNum1 = '';
  String operation = "";
  dynamic opr = '';
  dynamic preOpr = '';
  dynamic result = '';
  //Calculator logic
  dynamic text = '0';

  //Button Widget
  Widget calcbutton(
      String btnText, Color btnColor, Color txtColor, double fntSize) {
    return ElevatedButton(
      onPressed: () {
        calculation(btnText);
      },
      style: ElevatedButton.styleFrom(
        fixedSize: Size(70, 70),
        shape: CircleBorder(),
        primary: btnColor,
      ),
      child: Text(
        btnText,
        style: TextStyle(
            color: txtColor, fontFamily: "JosefinSans", fontSize: fntSize),
      ),
    );
  }

  void calculation(btnText) {
    if (btnText == 'AC') {
      text = '0';
      numOne = 0;
      numTwo = 0;
      result = '';
      finalResult = '0';
      opr = '';
      preOpr = '';
      oldNum1 = '';
      operation = '';
    } else if (opr == '=' && btnText == '=') {
      if (preOpr == '+') {
        finalResult = add();
      } else if (preOpr == '-') {
        finalResult = sub();
      } else if (preOpr == 'x') {
        finalResult = mul();
      } else if (preOpr == '/') {
        finalResult = div();
      }
    } else if (btnText == '+' ||
        btnText == '-' ||
        btnText == 'x' ||
        btnText == '/' ||
        btnText == '=' ||
        btnText == "^") {
      if (numOne == 0) {
        numOne = double.parse(result);
      } else {
        numTwo = double.parse(result);
      }

      if (opr == '+') {
        finalResult = add();
        operation = "+";
      } else if (opr == '-') {
        finalResult = sub();
        operation = '-';
      } else if (opr == 'x') {
        finalResult = mul();
        operation = "x";
      } else if (opr == '/') {
        finalResult = div();
        operation = "/";
      } else if (opr == "^") {
        finalResult = pwr();
        operation = "^";
      }
      preOpr = opr;
      opr = btnText;
      result = '';
    } else if (btnText == '.') {
      if (!result.toString().contains('.')) {
        result = result.toString() + '.';
      }
      finalResult = result;
    } else if (btnText == '+/-') {
      result.toString().startsWith('-')
          ? result = result.toString().substring(1)
          : result = '-' + result.toString();
      finalResult = result;
    } else {
      result = result + btnText;
      finalResult = result;
    }

    setState(() {
      text = finalResult;
    });
  }

  String add() {
    oldNum1 = numOne.toString();
    result = (numOne + numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String sub() {
    oldNum1 = numOne.toString();
    result = (numOne - numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String mul() {
    oldNum1 = numOne.toString();
    result = (numOne * numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String pwr() {
    oldNum1 = numOne.toString();
    result = (pow(numOne, numTwo)).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String div() {
    oldNum1 = numOne.toString();
    result = (numOne / numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String doesContainDecimal(dynamic result) {
    if (result.toString().contains('.')) {
      List<String> splitDecimal = result.toString().split('.');
      if (!(int.parse(splitDecimal[1]) > 0))
        return result = splitDecimal[0].toString();
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size.width;
    if (screenSize < 500) {
      return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          toolbarHeight: 26,
          title: const Text("Calculator"),
          centerTitle: true,
          backgroundColor: Colors.black,
          titleTextStyle: const TextStyle(
            fontFamily: "JosefinSans",
            color: Colors.white,
            fontSize: 25,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(),
                    child: Text(
                      (oldNum1.toString() + operation + numTwo.toString()),
                      style: TextStyle(
                        color: Color.fromARGB(100, 255, 255, 255),
                        fontSize: 40,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(),
                    child: Text(
                      '$text',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 100,
                      ),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  calcbutton("AC", Colors.teal, Colors.black, 25),
                  calcbutton("+/-", Colors.teal, Colors.black, 25),
                  calcbutton("^", Colors.teal, Colors.black, 30),
                  calcbutton(
                      "/", Color.fromARGB(255, 0, 48, 120), Colors.white, 30),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  calcbutton(
                      "7", Color.fromARGB(255, 49, 49, 49), Colors.white, 30),
                  calcbutton(
                      "8", Color.fromARGB(255, 49, 49, 49), Colors.white, 30),
                  calcbutton(
                      "9", Color.fromARGB(255, 49, 49, 49), Colors.white, 30),
                  calcbutton(
                      "x", Color.fromARGB(255, 0, 48, 120), Colors.white, 30),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  calcbutton(
                      "4", Color.fromARGB(255, 49, 49, 49), Colors.white, 30),
                  calcbutton(
                      "5", Color.fromARGB(255, 49, 49, 49), Colors.white, 30),
                  calcbutton(
                      "6", Color.fromARGB(255, 49, 49, 49), Colors.white, 30),
                  calcbutton(
                      "-", Color.fromARGB(255, 0, 48, 120), Colors.white, 30),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  calcbutton(
                      "1", Color.fromARGB(255, 49, 49, 49), Colors.white, 30),
                  calcbutton(
                      "2", Color.fromARGB(255, 49, 49, 49), Colors.white, 30),
                  calcbutton(
                      "3", Color.fromARGB(255, 49, 49, 49), Colors.white, 30),
                  calcbutton(
                      "+", Color.fromARGB(255, 0, 48, 120), Colors.white, 30),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      calculation("0");
                    },
                    style: ElevatedButton.styleFrom(
                      shape: StadiumBorder(),
                      primary: Color.fromARGB(255, 49, 49, 49),
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(28, 12, 90, 12),
                      child: Text(
                        "0",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Josefin Sans",
                            fontSize: 30),
                      ),
                    ),
                  ),
                  calcbutton(
                      ".", Color.fromARGB(255, 49, 49, 49), Colors.white, 30),
                  calcbutton(
                      "=", Color.fromARGB(255, 0, 48, 120), Colors.white, 30),
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
          toolbarHeight: 26,
          title: const Text("Calculator"),
          centerTitle: true,
          backgroundColor: Colors.black,
          titleTextStyle: const TextStyle(
            fontFamily: "Josefin Sans",
            color: Colors.white,
            fontSize: 25,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 300),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      (oldNum1.toString() + operation + numTwo.toString()),
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Color.fromARGB(100, 255, 255, 255),
                        fontSize: 40,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(width: 300),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      '$text',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 100,
                      ),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  calcbutton("AC", Colors.teal, Colors.black, 25),
                  SizedBox(
                    width: 25,
                  ),
                  calcbutton("+/-", Colors.teal, Colors.black, 25),
                  SizedBox(
                    width: 25,
                  ),
                  calcbutton("^", Colors.teal, Colors.black, 30),
                  SizedBox(
                    width: 25,
                  ),
                  calcbutton(
                      "/", Color.fromARGB(255, 0, 48, 120), Colors.white, 30),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  calcbutton(
                      "7", Color.fromARGB(255, 49, 49, 49), Colors.white, 30),
                  SizedBox(
                    width: 25,
                  ),
                  calcbutton(
                      "8", Color.fromARGB(255, 49, 49, 49), Colors.white, 30),
                  SizedBox(
                    width: 25,
                  ),
                  calcbutton(
                      "9", Color.fromARGB(255, 49, 49, 49), Colors.white, 30),
                  SizedBox(
                    width: 25,
                  ),
                  calcbutton(
                      "x", Color.fromARGB(255, 0, 48, 120), Colors.white, 30),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  calcbutton(
                      "4", Color.fromARGB(255, 49, 49, 49), Colors.white, 30),
                  SizedBox(
                    width: 25,
                  ),
                  calcbutton(
                      "5", Color.fromARGB(255, 49, 49, 49), Colors.white, 30),
                  SizedBox(
                    width: 25,
                  ),
                  calcbutton(
                      "6", Color.fromARGB(255, 49, 49, 49), Colors.white, 30),
                  SizedBox(
                    width: 25,
                  ),
                  calcbutton(
                      "-", Color.fromARGB(255, 0, 48, 120), Colors.white, 30),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  calcbutton(
                      "1", Color.fromARGB(255, 49, 49, 49), Colors.white, 30),
                  SizedBox(
                    width: 25,
                  ),
                  calcbutton(
                      "2", Color.fromARGB(255, 49, 49, 49), Colors.white, 30),
                  SizedBox(
                    width: 25,
                  ),
                  calcbutton(
                      "3", Color.fromARGB(255, 49, 49, 49), Colors.white, 30),
                  SizedBox(
                    width: 25,
                  ),
                  calcbutton(
                      "+", Color.fromARGB(255, 0, 48, 120), Colors.white, 30),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      calculation("0");
                    },
                    style: ElevatedButton.styleFrom(
                      shape: StadiumBorder(),
                      primary: Color.fromARGB(255, 49, 49, 49),
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(28, 12, 90, 12),
                      child: Text(
                        "0",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Josefin Sans",
                            fontSize: 30),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  calcbutton(
                      ".", Color.fromARGB(255, 49, 49, 49), Colors.white, 30),
                  SizedBox(
                    width: 25,
                  ),
                  calcbutton(
                      "=", Color.fromARGB(255, 0, 48, 120), Colors.white, 30),
                ],
              )
            ],
          ),
        ),
      );
    }
  }
}
