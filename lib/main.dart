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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    onPrimary: Colors.black,
                    primary: Colors.red,
                    fixedSize: const Size(345, 213)),
                onPressed: () {
                  setState(() {
                    buttonName1 = "Clicked";
                  });
                },
                child: Text(buttonName1),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isClicked = true;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
