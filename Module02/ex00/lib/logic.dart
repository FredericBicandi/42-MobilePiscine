import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

String? errorMsg;
String? cityName;
double? lat;
double? lon;

TextEditingController search = TextEditingController();
List<String> allCities = [
  "Beirut, Lebanon",
  "Tripoli, Lebanon",
  "Sidon, Lebanon",
  "Tyre, Lebanon",
  "Zahle, Lebanon",
  "Jounieh, Lebanon",
  "Byblos, Lebanon",
  "Batroun, Lebanon",
  "Baalbek, Lebanon",
  "Nabatieh, Lebanon",
  "Aley, Lebanon",
  "Bcharré, Lebanon",
  "Hermel, Lebanon",
  "Marjayoun, Lebanon",
  "Hasbaya, Lebanon",
  "Zgharta, Lebanon",
  "Koura, Lebanon",
  "Metn, Lebanon",
  "Chouf, Lebanon",
  "Akkar, Lebanon",
];

List<String> suggestions=[];

class LocationService {
  static Future<Position?> getLocationWeb() async {
    final res = await http.get(Uri.parse("http://ip-api.com/json"));
    final data = json.decode(res.body);
    return Position(
    latitude: data["lat"] * 1.0,
    longitude: data["lon"] * 1.0,
    timestamp: DateTime.now(),
    accuracy: 0.0,
    altitude: 0.0,
    heading: 0.0,
    speed: 0.0,
    speedAccuracy: 0.0,
    headingAccuracy: 0.0,
    altitudeAccuracy: 0.0,
    );

  }
  static Future<Position?> getLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return null;

    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return null;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return null;
    }

    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }

  static Future<String?> getCityName(double lat, double lon) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, lon);
    if (placemarks.isEmpty) return null;

    return placemarks.first.locality;
  }
}
