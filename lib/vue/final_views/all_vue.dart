import 'package:first_flutter_app/dao/dao.dart';
import 'package:first_flutter_app/global_manager.dart';
import 'package:first_flutter_app/io/i_o_listener.dart';
import 'package:first_flutter_app/modele/carte.dart';
import 'package:first_flutter_app/modele/modele_manager.dart';
import 'package:first_flutter_app/vue/bouton_lettre.dart';
import 'package:first_flutter_app/vue/vue_manager.dart';
import 'package:flutter/material.dart';
import 'package:after_layout/after_layout.dart';

class AllVue extends StatefulWidget {
  late Widget _vueScreen;

  late Widget _widgetCarreEcran;

  AllVue({Key? key}) : super(key: key) {
    _vueScreen = Container(
        color: Colors.blueAccent,
        child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white)),
                SizedBox(height: 10,),
            Text("Les pacomons sont en train de se réveiller ...", style: TextStyle(color: Colors.white))
          ],
        )));
    _widgetCarreEcran = AspectRatio(
      aspectRatio: 1,
      child: _vueScreen,
    );
  }

  void refresh() {
    _state!.setState(() {});
  }

  void setVueScreenAndRefresh(Widget vue) {
    _vueScreen = vue;
    _widgetCarreEcran = AspectRatio(
      aspectRatio: 1,
      child: _vueScreen,
    );
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
          widget._widgetCarreEcran,
          Expanded(
            // pesner a utiliser les Flexible
            child: Container(
              color: Colors.grey[800],
              constraints: BoxConstraints.expand(),
              /* 
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.purple)
                ), */
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        AspectRatio(
                            aspectRatio: 7.0 / 3.0,
                            child: Container(
                              constraints: BoxConstraints.expand(),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(child: Container()),
                                      Expanded(
                                        child: AspectRatio(
                                          aspectRatio: 1,
                                          child: BoutonLettre(
                                            text: '↑',
                                            typeBouton: BoutonsEnum.HAUT,
                                          ),
                                        ),
                                      ),
                                      Expanded(child: Container()),
                                      Expanded(child: Container()),
                                      Expanded(child: Container()),
                                      Expanded(
                                          child: AspectRatio(
                                              aspectRatio: 1,
                                              child: BoutonLettre(
                                                text: 'x',
                                                typeBouton: BoutonsEnum.X,
                                              ))),
                                      Expanded(child: Container())
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                          child: AspectRatio(
                                        aspectRatio: 1,
                                        child: BoutonLettre(
                                          text: '←',
                                          typeBouton: BoutonsEnum.GAUCHE,
                                        ),
                                      )),
                                      Expanded(child: Container()),
                                      Expanded(
                                          child: AspectRatio(
                                              aspectRatio: 1,
                                              child: BoutonLettre(
                                                text: '→',
                                                typeBouton: BoutonsEnum.DROITE,
                                              ))),
                                      Expanded(child: Container()),
                                      Expanded(
                                          child: AspectRatio(
                                              aspectRatio: 1,
                                              child: BoutonLettre(
                                                text: 'y',
                                                typeBouton: BoutonsEnum.Y,
                                              ))),
                                      Expanded(child: Container()),
                                      Expanded(
                                          child: AspectRatio(
                                              aspectRatio: 1,
                                              child: BoutonLettre(
                                                text: 'a',
                                                typeBouton: BoutonsEnum.A,
                                              ))),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(child: Container()),
                                      Expanded(
                                        child: AspectRatio(
                                          aspectRatio: 1,
                                          child: BoutonLettre(
                                            text: '↓',
                                            typeBouton: BoutonsEnum.BAS,
                                          ),
                                        ),
                                      ),
                                      Expanded(child: Container()),
                                      Expanded(child: Container()),
                                      Expanded(child: Container()),
                                      Expanded(
                                          child: AspectRatio(
                                              aspectRatio: 1,
                                              child: BoutonLettre(
                                                text: 'b',
                                                typeBouton: BoutonsEnum.B,
                                              ))),
                                      Expanded(child: Container())
                                    ],
                                  )
                                ],
                              ),
                            ))
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  Container(
                    width: 1000,
                    height: 20,
                    child: Center(
                      child: Text('C H E E S E B U R G E R  C O R P .',
                          style: TextStyle(color: Colors.white)),
                    ),
                  )
                ],
              ),

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
          ),
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
