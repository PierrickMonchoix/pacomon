import 'package:first_flutter_app/dao/dao.dart';
import 'package:first_flutter_app/global_manager.dart';
import 'package:first_flutter_app/modele/carte.dart';
import 'package:first_flutter_app/modele/modele_manager.dart';
import 'package:first_flutter_app/presentation/carte_pres.dart';
import 'package:first_flutter_app/presentation/presentation_manager.dart';
import 'package:first_flutter_app/vue/vue_manager.dart';
import 'package:flutter/material.dart';
import 'package:after_layout/after_layout.dart';


abstract class Refreshable {
  void refresh();
}


class AllVue extends StatefulWidget {
  AllVue({ Key? key }) : super(key: key);

  Widget _vue = Expanded(
      child: Container(
        color: Colors.blueAccent,
      ),
    );

  void setVueAndRefresh(Widget vue){
    _vue = vue;
    _state!.setState(() {
      
    });
  }

  _AllVueState? _state;

  @override
  _AllVueState createState() => _AllVueState();
}

class _AllVueState extends State<AllVue> {
  @override
  Widget build(BuildContext context) {
    widget._state = this;

    return widget._vue;
  }
}