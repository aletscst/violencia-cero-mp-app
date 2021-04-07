import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:violencia_cero/src/models/attention_center_model.dart';

class AttentionCenterPage extends StatefulWidget {
  @override
  State<AttentionCenterPage> createState() => AttentionCenterPageState();
}

class AttentionCenterPageState extends State<AttentionCenterPage> {
  Completer<GoogleMapController> _controller = Completer();
  final Set<Marker> _markers = Set();
  final double _zoom = 17;

  @override
  Widget build(BuildContext context) {
    final Datum attentionCenter = ModalRoute.of(context).settings.arguments;
    _markers.add(
      Marker(
        markerId: MarkerId(attentionCenter.nombre),
        position: LatLng(attentionCenter.lat, attentionCenter.long),
        infoWindow: InfoWindow(
          title: attentionCenter.nombre,
          snippet: attentionCenter.direccion,
        ),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(attentionCenter.nombre),
        backgroundColor: Colors.purple[300],
      ),
      body: Stack(
        children: <Widget>[
          _getMap(attentionCenter),
        ],
      ),
    );
  }

//
  Widget _getMap(Datum attCent) {
    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: LatLng(attCent.lat, attCent.long),
        zoom: _zoom,
      ),
      markers: _markers,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
    );
  }
//
  //Future<void> _goToNewYork() async {
  //  double lat = 40.7128;
  //  double long = -74.0060;
  //  GoogleMapController controller = await _controller.future;
  //  controller
  //      .animateCamera(CameraUpdate.newLatLngZoom(LatLng(lat, long), _zoom));
  //  setState(() {
  //    _markers.add(
  //      Marker(
  //        markerId: MarkerId('newyork'),
  //        position: LatLng(lat, long),
  //      ),
  //    );
  //  });
  //}
}
