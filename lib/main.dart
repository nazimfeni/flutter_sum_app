import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_sum_app/style.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Summation App",
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Map<String, double> FormValue = {"num1": 0, "num2": 0};

  double SUM = 0;
  @override
  Widget build(BuildContext context) {
    MyInputOnChange(InputKey, InputValue) {
      setState(() {
        FormValue.update(InputKey, (value) => double.parse(InputValue));
      });


    }

    AddAllNumber(){
    setState(() {
      SUM = FormValue["num1"]! + FormValue["num2"]!;
    });

    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Sum App"),
      ),
      body: Padding(
        padding: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              SUM.toString(),
              style: HeadTextStyle(),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              onChanged: (value) {
                // set value to num1
                MyInputOnChange("num1", value);
              },
              decoration: AppInputStyle("First Number"),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              onChanged: (value) {

                MyInputOnChange("num2", value);
              },
              decoration: AppInputStyle("Last Number"),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {

                      AddAllNumber();
                    },
                    style: AppButtonStyle(),
                    child: Text("Add")))
          ],
        ),
      ),
    );
  }
}
