import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

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
      home: HomePage(),
    );
  }
}
//
//
//
//
//
//
//
//
//
//
//
//

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

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
        backgroundColor: const Color.fromARGB(255, 110, 0, 140),
        titleTextStyle: const TextStyle(
          fontFamily: "Poppins",
          color: Colors.white,
          fontSize: 24,
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
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
                        builder: (BuildContext context) => const Calculator(),
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
          )
        ],
      ),
    );
  }
}

//
//
//
//
//
//
//
//
//
//
//
//
class Calculator extends StatelessWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
