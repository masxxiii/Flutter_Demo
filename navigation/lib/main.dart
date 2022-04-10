import 'package:flutter/material.dart';
import 'dart:math';

// Colors
const appBarColor = Color(0xFF06113C);
const columnA = Color(0xFFFF8C32);
const columnB = Color(0xFFDDDDDD);
const columnC = Color(0xFFEEEEEE);

// Numbers
num numA = 0;
num numB = 0;
num result = 0;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // Root
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Navigation',
      theme: ThemeData(appBarTheme: const AppBarTheme(color: appBarColor)),
      home: const MainView(title: 'Sum Of Squares'),
    );
  }
}

class MainView extends StatefulWidget {
  const MainView({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {

  final _formKey = GlobalKey <FormState>();
  final textControllerA = TextEditingController();
  final textControllerB = TextEditingController();
  bool agreement = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(widget.title)
        ),
        body: buildFields(context)
    );
  }

  Widget buildFields(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30.0),

      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget> [

            // ---------------Input Fields---------------
            TextFormField(keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: 'Enter value of a',
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      onPressed: () {
                        textControllerA.clear();
                      },
                      icon: const Icon(Icons.clear))
                ),
                controller: textControllerA,
                validator: (value) {
              if (value!.isEmpty) {
              }
            }),
            TextFormField(keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: 'Enter value of b',
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                        onPressed: () {
                          textControllerB.clear();
                        },
                        icon: const Icon(Icons.clear))
                ),
                controller: textControllerB,
                validator: (value) {
                  if (value!.isEmpty) {
                  }
                }),

            // ---------------Check Box---------------
            CheckboxListTile(
                value: agreement,
                title: const Text('I agree to the use of my personal data.'),
                onChanged: (bool? value) => setState(() {
                  agreement = value!;
                })),

            // ---------------Button---------------
            ElevatedButton(
                onPressed: () {
                  if (agreement) {
                    setState(() {
                      numA = int.parse(textControllerA.text);
                      numB = int.parse(textControllerB.text);
                    });
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const SecondView()));
                  }
                },
                child: const Text('Calculate'))
          ],
        ),
      ),
    );
  }
}

class SecondView extends StatelessWidget {
  const SecondView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    result = (pow(numA,2)) + (pow(numB,2)) + 2 * numA * numB;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('The answer is: $result'),
      ),
    );
  }
}