import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitude;
  Location(this.longitude, this.latitude);
  getCurrentLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();
    try {
      if (permission == LocationPermission.always ||
          permission == LocationPermission.values ||
          permission == LocationPermission.whileInUse) {
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.medium);
        print(position);
      } else {
        print('Permission denied');
      }
    } catch (err) {
      print(err);
    }
  }
}
