import 'package:clima_flutter/services/location.dart';
import 'package:flutter/material.dart';
import 'package:clima_flutter/services/networking.dart';
import 'package:clima_flutter/utilities/constants.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude = 0.0;
  double longitude = 0.0;
  @override
  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;
    NetworkHelper netHelp = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=-$longitude&appid=$kApiKey');
    var weatherData = await netHelp.getData();
  }

  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
