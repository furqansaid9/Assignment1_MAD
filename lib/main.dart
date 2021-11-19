import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

String ans = "";
List fruits = [
  'Apple',
  'Orange',
  'Rambutan',
  'Please Enter a number between 1 and 3 only'
];

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Using List in Flutter',
      home: MyCustomForm(),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  // Create a text controller and use it to retrieve the current value of the TextField.
  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Using List in Flutter'),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: myController,
          decoration: const InputDecoration.collapsed(
              hintText: 'Enter a number between 1 and 3'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // When the user presses the button, show an alert dialog containing
        // the text that the user has entered into the text field.
        backgroundColor: Colors.deepPurpleAccent,
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              if (myController.text == '1') {
                ans = fruits[0];
              } else if (myController.text == '2') {
                ans = fruits[1];
              } else if (myController.text == '3') {
                ans = fruits[2];
              } else {
                ans = fruits[3];
              }
              return AlertDialog(
                content: Text(ans),
              );
            },
          );
        },
        tooltip: 'Show result',
        child: const Icon(Icons.text_fields),
      ),
    );
  }
}
