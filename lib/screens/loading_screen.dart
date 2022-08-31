import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}
class _LoadingScreenState extends State<LoadingScreen> {
  LocationPermission permission;

  Future<void> getLocation() async {
    permission = await Geolocator.requestPermission();
    try{
      if(permission == LocationPermission.always){
        Position position = await Geolocator.getCurrentPosition();
        print(position);
      }else{
        print('Permission denied');
      }
    }catch(err){
     print(err);
    }


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {
            //Get the current location
            getLocation();
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
