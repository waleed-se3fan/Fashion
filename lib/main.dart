import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashion/firebase_options.dart';
import 'package:fashion/screens/authentication/sign_in.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: SignInScreen());
  }
}

///////////////////Google Map //////////////
/*
class MyGoogleMap extends StatefulWidget {
  const MyGoogleMap({super.key});

  @override
  State<MyGoogleMap> createState() => _MyGoogleMapState();
}

class _MyGoogleMapState extends State<MyGoogleMap> {
  var type = MapType.normal;

  double lat = 5;
  double long = 10;
  void getLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    lat = position.latitude;
    long = position.longitude;
    setState(() {});
    print(position);
  }

  Set<Marker> createMarker() {
    return {
      Marker(
        markerId: MarkerId("marker_1"),
        position: LatLng(lat, long),
        infoWindow: InfoWindow(title: 'My Location'),
      ),
      const Marker(
        markerId: MarkerId("marker_2"),
        position: LatLng(18.997962200185533, 72.8379758747611),
      ),
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                type = MapType.satellite;
                setState(() {});
              },
              icon: Icon(Icons.share_location_outlined)),
          IconButton(
              onPressed: () {
                getLocation();
              },
              icon: Icon(Icons.location_on)),
        ],
        title: const Text('My Google Map'),
      ),
      body: GoogleMap(
          trafficEnabled: true,
          myLocationEnabled: true,
          mapToolbarEnabled: true,
          mapType: type,
          markers: createMarker(),
          initialCameraPosition: const CameraPosition(
              target: LatLng(19.018255973653343, 72.84793849278007))),
    );
  }
}
*/
/*class Trial extends StatefulWidget {
  const Trial({super.key});

  @override
  State<Trial> createState() => _TrialState();
}

class _TrialState extends State<Trial> {
  getData(x) async {
    String? mydata;
    await Firebase.initializeApp();
    var data = await (FirebaseFirestore.instance
        .collection('Electronics')
        .doc(x.toString())
        .get());
    setState(() {});
    mydata = data.data()!['url'].toString();
    return mydata;
  }

  @override
  void initState() {
    // TODO: implement initState
    getData(0);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          FlutterLogo(),
          Container(
            height: 400,
            child: ListView.builder(
                itemCount: 7,
                itemBuilder: (c, i) {
                  return FutureBuilder(
                      future: getData(i + 1),
                      builder: (c, s) {
                        return Image.network(s.data.toString());
                      });
                }),
          )
        ],
      ),
    );
  }
}*/
