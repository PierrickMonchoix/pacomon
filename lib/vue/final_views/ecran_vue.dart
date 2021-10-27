import 'package:first_flutter_app/vue/carte_vue.dart';
import 'package:flutter/material.dart';

class EcranVue extends StatefulWidget {

  List<Widget> _listWidget = [];


  EcranVue({ Key? key , required List<Widget> listWidget }) : _listWidget = listWidget , super(key: key);

  

  @override
  _EcranVueState createState() => _EcranVueState();
}

class _EcranVueState extends State<EcranVue> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      child : Stack(children: widget._listWidget)
      
    );
  }
}