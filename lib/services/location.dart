import 'package:geolocator/geolocator.dart';

class Location {
  double latitude = 0;
  double longitude = 0;

  Future<void> get_location() async {
    try {
      LocationPermission permissionn = await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitude = await position.latitude;
      longitude = await position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
