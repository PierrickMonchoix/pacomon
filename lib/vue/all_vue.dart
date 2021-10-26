import 'package:first_flutter_app/dao/dao.dart';
import 'package:first_flutter_app/global_manager.dart';
import 'package:first_flutter_app/modele/carte.dart';
import 'package:first_flutter_app/modele/modele_manager.dart';
import 'package:first_flutter_app/presentation/carte_pres.dart';
import 'package:first_flutter_app/presentation/presentation_manager.dart';
import 'package:first_flutter_app/vue/bouton_lettre.dart';
import 'package:first_flutter_app/vue/vue_manager.dart';
import 'package:flutter/material.dart';
import 'package:after_layout/after_layout.dart';

abstract class Refreshable {
  void refresh();
}

class AllVue extends StatefulWidget {
  AllVue({Key? key}) : super(key: key);

  Widget _vueScreen = AspectRatio(
    aspectRatio: 1,
    child: Container(
      color: Colors.blueAccent,
    ),
  );

  void setVueScreenAndRefresh(Widget vue) {
    _vueScreen = vue;
    _state!.setState(() {});
  }

  _AllVueState? _state;

  @override
  _AllVueState createState() => _AllVueState();
}

class _AllVueState extends State<AllVue> {
  @override
  Widget build(BuildContext context) {
    widget._state = this;
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          widget._vueScreen,
          Expanded( // pesner a utiliser les Flexible
            child: Container(
                color: Colors.grey[800],
                constraints: BoxConstraints.expand(),
                /* 
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.purple)
                ), */
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    AspectRatio(
                        aspectRatio: 7.0 / 3.0,
                        child: Container(
                          color: Colors.grey[800],
                          constraints: BoxConstraints.expand(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(child: Container()),
                                  Expanded(
                                    child: AspectRatio(aspectRatio: 1,
                                      child: BoutonLettre(
                                        text: '↑',
                                        function: {print("btn a")},
                                      ),
                                    ),
                                  ),
                                  Expanded(child: Container()),
                                  Expanded(child: Container()),
                                  Expanded(child: Container()),
                                  Expanded(
                                    child: AspectRatio(aspectRatio: 1,
                                      child: BoutonLettre(
                                    text: 'x',
                                    function: {print("btn a")},
                                  ))),
                                  Expanded(child: Container())
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: AspectRatio(aspectRatio: 1,
                                    child: BoutonLettre(
                                      text: '←',
                                      function: {print("btn a")},
                                    ),
                                  )),
                                  Expanded(child: Container()),
                                  Expanded(child: AspectRatio(aspectRatio: 1,
                                      child: BoutonLettre(
                                    text: '→',
                                    function: {print("btn a")},
                                  ))),
                                  Expanded(child: Container()),
                                  Expanded(
                                    child: AspectRatio(aspectRatio: 1,
                                      child: BoutonLettre(
                                    text: 'y',
                                    function: {print("btn a")},
                                  ))),
                                  Expanded(child: Container()),
                                  Expanded(
                                    child: AspectRatio(aspectRatio: 1,
                                      child: BoutonLettre(
                                    text: 'b',
                                    function: {print("btn a")},
                                  ))),
                                ],
                              ),Row(
                                children: [
                                  Expanded(child: Container()),
                                  Expanded(
                                    child: AspectRatio(aspectRatio: 1,
                                      child: BoutonLettre(
                                        text: '↑',
                                        function: {print("btn a")},
                                      ),
                                    ),
                                  ),
                                  Expanded(child: Container()),
                                  Expanded(child: Container()),
                                  Expanded(child: Container()),
                                  Expanded(
                                    child: AspectRatio(aspectRatio: 1,
                                      child: BoutonLettre(
                                    text: 'x',
                                    function: {print("btn a")},
                                  ))),
                                  Expanded(child: Container())
                                ],
                              )
                            ],
                          ),
                        ))
                  ],
                )

                /* Padding(
                    padding: const EdgeInsets.all(10),
                    child : Center(child: 
                         Row(
                          children: [
                            Expanded(
                              child: BoutonLettre(
                                text: '←',
                                function: {print("btn a")},
                              ),
                            ),
                            Expanded(
                              child: Column(
                              children: [
                            BoutonLettre(
                              text: '↑',
                              function: {print("btn a")},
                            ),
                            Container(
                              height: BoutonLettre.taille,
                              width: BoutonLettre.taille,
                            ),
                            BoutonLettre(
                              text: '↓',
                              function: {print("btn a")},
                            ),
                              ])),
                            BoutonLettre(
                              text: '→',
                              function: {print("btn b")},
                            ),
                          ],
                        ), 
                    )
                      ) */
                ),

            /* Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Gameboy", style: TextStyle(color: Colors.white)),
                         Row(
                          children: [
                            BoutonLettre(
                              text: '←',
                              function: {print("btn a")},
                            ),
                            Column(
                              children: [
                            BoutonLettre(
                              text: '↑',
                              function: {print("btn a")},
                            ),
                            Container(
                              height: BoutonLettre.taille,
                              width: BoutonLettre.taille,
                            ),
                            BoutonLettre(
                              text: '↓',
                              function: {print("btn a")},
                            ),
                              ]),
                            BoutonLettre(
                              text: 'a',
                              function: {print("btn b")},
                            ),
                          ],
                        ), 
                        Text('C H E E S E B U R G E R  C O R P .',
                            style: TextStyle(color: Colors.white))
                      ],
                    ), */
          )
          /* child: Row(
                  children: [
                    Container(
                      color: Colors.red[100],
                      height: 25,
                      width: 25,
                    ),
                    Container(
                      color: Colors.red[500],
                      height: 25,
                      width: 25,
                    ),
                    Container(
                      color: Colors.red[800],
                      height: 25,
                      width: 25,
                    ),
                  ],
                ) */

          /*  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Gameboy", style: TextStyle(color: Colors.white)),
                        /* Row(
                          children: [
                            BoutonLettre(
                              text: 'a',
                              function: {print("btn a")},
                            ),
                            BoutonLettre(
                              text: 'b',
                              function: {print("btn b")},
                            ),
                          ],
                        ), */
                        Text('C H E E S E B U R G E R  C O R P .',
                            style: TextStyle(color: Colors.white))
                      ],
                    ),
                  )  */
        ],
      ),
    );
  }
}
