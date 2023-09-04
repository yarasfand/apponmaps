import 'package:flutter/material.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';

class doSearchOnMap extends StatefulWidget {
  const doSearchOnMap({super.key});

  @override
  State<doSearchOnMap> createState() => _doSearchOnMapState();
}

class _doSearchOnMapState extends State<doSearchOnMap> {
  @override
  Widget build(BuildContext context) {

    String address = "";

    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: Center(
                child: Text(address)),
            ),
            SizedBox(
              height: 500,
              child:  OpenStreetMapSearchAndPick(
                  center: LatLong(31.2108291, 70.1812037),
                  buttonColor: Colors.blue,
                  buttonText: 'Set Current Location',
                  onPicked: (pickedData) {
                    setState(() {
                      address = pickedData.addressName.toString();
                    });
                  }),
            )
          ],
        ),
      ),
    );
  }
}
