// ignore_for_file: unused_local_variable, avoid_print, prefer_const_constructors
import 'package:location/location.dart' as loc;
import 'package:geolocator/geolocator.dart';

class LocationFetch {
  late double longitude;
  late double latitude;

  Future<void> getCurrentLocation() async {
    try {
      loc.Location location = loc.Location();

      await Geolocator.requestPermission();
      await location.requestService();
      print("GEtting Location");
      Position position = await Geolocator.getCurrentPosition(
        forceAndroidLocationManager: true,
        desiredAccuracy: LocationAccuracy.low,
      );
      print("came below get current position");
      longitude = position.longitude;
      latitude = position.latitude;
      print(latitude);
      print(longitude);
      print("exiting location file");
    } catch (e) {
      print("came in catch");
      await getCurrentLocation();
      print(e);
    }
    //   // bool serviceEnabled;
    //   // LocationPermission permission;

    //   // // Test if location services are enabled.
    //   // serviceEnabled = await Geolocator.isLocationServiceEnabled();
    //   // if (!serviceEnabled) {
    //   //   print("Location not enabled");
    //   //   loc.Location location = loc.Location();
    //   //   location.requestService();
    //   //   // Location services are not enabled don't continue
    //   //   // accessing the position and request users of the
    //   //   // App to enable the location services.
    //   //   return;
    //   // }

    //   // permission = await Geolocator.checkPermission();
    //   // if (permission == LocationPermission.denied) {
    //   //   permission = await Geolocator.requestPermission();
    //   //   if (permission == LocationPermission.deniedForever) {
    //   //     // Permissions are denied forever, handle appropriately.
    //   //     return;
    //   //   }
    //   // }

    //   // if (permission == LocationPermission.denied) {
    //   //   // Permissions are denied, next time you could try
    //   //   // requesting permissions again (this is also where
    //   //   // Android's shouldShowRequestPermissionRationale
    //   //   // returned true. According to Android guidelines
    //   //   // your App should show an explanatory UI now.
    //   //   return;
    //   // }

    //   // // When we reach here, permissions are granted and we can
    //   // // continue accessing the position of the device.

    //   // return await Geolocator.getCurrentPosition(
    //   //   desiredAccuracy: LocationAccuracy.bestForNavigation,
    //   //   forceAndroidLocationManager: true,
    //   //   timeLimit: null,
    //   // ).then((Position position) {
    //   //   latitude = position.latitude;
    //   //   longitude = position.longitude;
    //   // }).catchError((e) {
    //   //   print(e);
    //   // });
    // }
  }
}
