import 'package:pacomon/vue/carte_vue.dart';
import 'package:flutter/material.dart';

class EcranVue extends StatefulWidget {

  List<Widget> listWidget = [];


  EcranVue({ Key? key , required List<Widget> listWidget }) : listWidget = listWidget , super(key: key);

  

  @override
  _EcranVueState createState() => _EcranVueState();
}

class _EcranVueState extends State<EcranVue> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      child : Stack(children: widget.listWidget)
      
    );
  }
}