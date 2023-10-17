import 'package:flutter/material.dart';
import 'DataModel.dart';

class Page2 extends StatelessWidget {
  final DataModel data;

  Page2({required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page 2')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Name: ${data.name}'),
            Text('Email: ${data.email}'),
            Text('Password: ${data.password}'),
            Text('date: ${data.date}'),
          
            Text('You selected: ${data.selectedGender}'),

          ],
        ),
      ),
    );
  }
}