import 'dart:convert';

class PacomonXls {
  String _nom;
  String _pathImage;
  String _rarete;
  String _atk;
  String _def;
  String _pvMax;
  String _categorie;
  String _exp;
  String vit;
 

  String get nom => this._nom;
  String get pathImage => this._pathImage;
  String get rarete => this._rarete;
  String get atk => this._atk;
  String get def => this._def;
  String get pvMax => this._pvMax;
  String get categorie => this._categorie;
  String get exp => this._exp;

  PacomonXls({required String vit , required String exp , required String nom , required String pathImage , required String rarete , required String atk, required String def, required String pvMax, required String categorie}) : _exp = exp , _nom = nom , _pathImage = pathImage , _rarete = rarete , _atk = atk , _def = def, _pvMax = pvMax, _categorie = categorie , vit = vit;



  Map<String, dynamic> toMap() {
    return {
      '_nom': _nom,
      '_pathImage': _pathImage,
      '_rarete': _rarete,
      '_atk': _atk,
      '_def': _def,
      '_pvMax': _pvMax,
      '_categorie': _categorie,
      '_exp': _exp,
      'vit': vit,
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is PacomonXls &&
      other._nom == _nom &&
      other._pathImage == _pathImage &&
      other._rarete == _rarete &&
      other._atk == _atk &&
      other._def == _def &&
      other._pvMax == _pvMax &&
      other._categorie == _categorie &&
      other._exp == _exp &&
      other.vit == vit;
  }

  @override
  int get hashCode {
    return _nom.hashCode ^
      _pathImage.hashCode ^
      _rarete.hashCode ^
      _atk.hashCode ^
      _def.hashCode ^
      _pvMax.hashCode ^
      _categorie.hashCode ^
      _exp.hashCode ^
      vit.hashCode;
  }

  @override
  String toString() {
    return 'PacomonXls(_nom: $_nom, _pathImage: $_pathImage, _rarete: $_rarete, _atk: $_atk, _def: $_def, _pvMax: $_pvMax, _categorie: $_categorie, _exp: $_exp, vit: $vit)';
  }
}
