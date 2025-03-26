import 'package:flutter/material.dart';

class CadastroController extends ChangeNotifier{

  final txtNome = TextEditingController();
  final txtEmail = TextEditingController();
  final txtCpf = TextEditingController();
  final txtTelefone = TextEditingController();
  final txtEndereco = TextEditingController();
  final txtDataNascimento = TextEditingController();

  bool _aceito = false;

  bool get aceito => _aceito;

  void atualizarAceito(value){
    _aceito = value;
    notifyListeners();
  }

  void limpar(){
    txtNome.clear();
    txtEmail.clear();
    _aceito = false;
    notifyListeners();
  }

}