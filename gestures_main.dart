import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 // double scale=1.0;
 Offset offset= const Offset(0.0, 0.0);

  @override
  Widget build(BuildContext context) {
 
    return Scaffold(
      appBar:AppBar (title:const Text('APPP BAR')),
      body:GestureDetector(
        onPanUpdate: (details){
          setState(() {
            offset=Offset(
              offset.dx+details.delta.dx, offset.dy + details.delta.dy
            );
          });
        },
        child : Transform.translate(
          offset: offset,
          child: Center(
          child: Container(
            height: 100,
          width: 100,
          color: Colors.blue,)
          ),
        )

        /*onTap: () {
          //ScaffoldMessenger.of(context).showSnackBar(
            //const SnackBar(
              //content:Text ("on Tap Detected"),
            //),
          //);
        //},
         onDoubleTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content:Text ("on Double Tap Detected"),
            ),
          );
        },
         onLongPress: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content:Text ("on Long Press"),
            ),
          );
        },*/
      )
    );
  }
}
