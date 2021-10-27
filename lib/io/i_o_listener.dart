enum BoutonsEnum {
  HAUT, BAS, GAUCHE, DROITE, X, A, Y, B
}


abstract class IOListener {
  
  void whenNotify(BoutonsEnum boutonsEnum);

}