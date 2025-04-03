import 'package:flutter/material.dart';

class RecuperarSenhaController extends ChangeNotifier{

  final txtEmail = TextEditingController();
  final txtTelefone = TextEditingController();

  bool _aceito = false;

  bool get aceito => _aceito;

  void atualizarAceito(value){
    _aceito = value;
    notifyListeners();
  }

  void limpar(){
    txtEmail.clear();
    txtTelefone.clear();
    _aceito = false;
    notifyListeners();
  }

}