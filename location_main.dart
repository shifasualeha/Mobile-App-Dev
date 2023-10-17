import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}); // Removed unnecessary super.key

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'My App Home Page'), // Added home property
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Position? _currentPosition;
  String? _currentAddress;

  Future<bool> _handlePermission() async{
    bool _serviceEnabled;
    LocationPermission permission;
    _serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if(!_serviceEnabled){
      ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("enabled locator services"),
        ),
      );
      return false;
    }
    permission=await Geolocator.checkPermission();
    if(permission==LocationPermission.denied){
      permission=await Geolocator.requestPermission();
    }
    if(permission==LocationPermission.denied){
       ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("location permission denied"),
        ),
      );
      return false;
    }
    if(permission==LocationPermission.deniedForever){
       ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("location permission denied go to your app settings"),
        ),
      );
      return false;
    }
     return true;
    
      }
      Future<void> _getCurrentLocation() async{
        final bool hasPermission = await _handlePermission();
        if(!hasPermission){
        return;}
        
      try{
         final Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high );
        setState((){
          _currentPosition = position;
        });
        getAddressFromCoordinates(_currentPosition!);
      }
      
      catch(e){
        debugPrint (e.toString());
      }
     
        }
        Future<void> getAddressFromCoordinates (Position position) async
        {
          final List<Placemark> placemark =
          await placemarkFromCoordinates(position.latitude, position.longitude);
          final place = placemark[0];
          setState(() {
            _currentAddress= "${place.name}, ${place.street}, ${place.locality}";
          });
        }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appbar'),
      ),
      body: Center(
        child: Column(
          children: [
          SizedBox(height: 10,),
          Text('LAT: ${_currentPosition?.latitude ?? ""}'),
          SizedBox(height: 10,),
           Text('LNG: ${_currentPosition?.longitude ?? ""}'),
            SizedBox(height: 10,),
             Text('ADDRESS: ${_currentAddress ?? ""}'),
            SizedBox(height: 10,),
            const Text('Im Shifa'),
            SizedBox(height: 10,),
            const Text('Doing Flutter RN'),
            SizedBox(height: 10,),
            ElevatedButton(
              onPressed: _getCurrentLocation,
                // Add your button click logic here
                           
              child: const Text('Elevated Button'),
            ),
          ],
        ),
      ),
    );
  }
}
//geocoding  cordinates ko convert karta hai human readable code main