// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'calculator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String buttonName1 = "Calculator";
  bool isClicked = false;
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Utilities",
      theme: ThemeData(
        primaryColor: Colors.black,
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.white, fontFamily: "MyriadPro"),
          bodyText2: TextStyle(color: Colors.white, fontFamily: "MyriadPro"),
          button: TextStyle(color: Colors.white, fontFamily: "MyriadPro"),
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 36,
        title: const Text("Utilities"),
        backgroundColor: Colors.black,
        titleTextStyle: const TextStyle(
          fontFamily: "MyriadPro",
          color: Colors.white,
          fontSize: 24,
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black,
        child: LayoutBuilder(
          builder: (context, constraints) {
            int crossCount = 0;
            final double screenWidthSize = MediaQuery.of(context).size.width;
            if (screenWidthSize > 720) {
              crossCount = 3;
            } else if (screenWidthSize > 520) {
              crossCount = 2;
            } else {
              crossCount = 1;
            }
            return GridView.count(
              mainAxisSpacing: 20,
              crossAxisCount: crossCount,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      onPrimary: Colors.black,
                      primary: const Color.fromARGB(255, 118, 118, 118),
                      elevation: 20,
                      fixedSize: const Size(345, 213)),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) => Calculator(),
                      ),
                    );
                  },
                  child: Image.network(
                      "https://raw.githubusercontent.com/FoxTail389/Utilities/main/images/Calculator.png"),
                ),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: "Settings",
            icon: Icon(Icons.settings),
          ),
        ],
        backgroundColor: Colors.black,
        unselectedItemColor: const Color.fromARGB(255, 100, 0, 0),
        selectedLabelStyle: TextStyle(fontFamily: "MyriadPro"),
        unselectedLabelStyle: TextStyle(fontFamily: "MyriadPro"),
        fixedColor: Colors.red,
      ),
    );
  }
}
