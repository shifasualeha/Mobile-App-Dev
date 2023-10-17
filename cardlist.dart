import 'package:flutter/material.dart';
import 'package:navigation_lab/cardlist.dart';
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Text and Button'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'this is a text',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20), // Adding some spacing between Text and Button
            ElevatedButton(
              onPressed: () {
                // Code to execute when the button is pressed
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => MyAppp())
                );
                Navigator.of(context).pop;

                print('Button was pressed!');
              },
              child: Text('click here'),
            ),
          ],
        ),
     ),
);
}
}