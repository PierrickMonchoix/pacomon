import 'package:flutter/material.dart';

class MapView extends StatefulWidget {
  const MapView({Key? key}) : super(key: key);

  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(color: Colors.grey[800], child: Table(
        children: [
          TableRow(
            children: [
              AspectRatio(aspectRatio: 1, child: Image.asset("assets/for_tests/img_1.png")),
              AspectRatio(aspectRatio: 1, child: Container(color: Colors.blue[300])),
              AspectRatio(aspectRatio: 1, child: Container(color: Colors.blue[500])),
              AspectRatio(aspectRatio: 1, child: Container(color: Colors.blue[700])),
            ]
          )
        ],
      )),
    );
  }
}
