import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Location {
  double latitude = 0;
  double longitude = 0;
  Future<void> getCurrentLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always) {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;
    } else {
      print("Location permission not granted");
    }
  }
}
//    var condition = weatherData['weather'][0]['id'];
//    var temp = weatherData['main']['temp'];
//    var cityName = weatherData['name'];
