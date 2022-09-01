import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitude;
  Location();
  getCurrentLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();
    try {
      if (permission == LocationPermission.always ||
          permission == LocationPermission.values ||
          permission == LocationPermission.whileInUse) {
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.medium);
        latitude = position.latitude;
        longitude = position.longitude;
      } else {
        print('Permission denied');
      }
    } catch (err) {
      print(err);
    }
  }
}
