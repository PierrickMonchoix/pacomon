class Personnage {
  int _age = 0;

  Personnage(this._age);

  void birthday() {
    _age++;
  }

  int getAge(){
    return _age;
  }

}
