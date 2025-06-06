import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:get_it/get_it.dart';

import 'controller/cadastro_controller.dart';
import 'package:aula_navigator/view/muhenhome_view.dart';
import 'package:aula_navigator/view/home_view.dart';
import 'package:aula_navigator/view/cadastro_view.dart';
import 'package:aula_navigator/view/login_view.dart';
import 'package:aula_navigator/view/conta_view.dart';
import 'package:aula_navigator/view/meuspedidos_view.dart';
import 'package:aula_navigator/view/config_view.dart';
import 'package:aula_navigator/view/sobre_view.dart';
import 'package:aula_navigator/view/carrinho_view.dart';
import 'package:aula_navigator/view/recuperarsenha_view.dart';


final g = GetIt.instance;

void main() {
  //Registrar o controlador
  g.registerSingleton<CadastroController>(CadastroController());
  runApp(
    DevicePreview(
      builder: (context) => const MainApp()
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Navegação',
      initialRoute: 'home',
      routes: {
        'home': (context) => const HomeView(),
        'cadastro': (context) => const CadastroView(),
        'login': (context) => const LoginView(),
        'recuperar_senha' : (context) => const SenhaView(),
        'tela_inicial': (context) => const MuhenHomeView(),
        'conta': (context) => const ContaView(),
        'meus_pedidos': (context) => const MeusPedidosView(),
        'configuracoes': (context) => const ConfigView(),
        'sobre': (context) => const SobreView(),
        'carrinho': (context) => const CarrinhoView(),
       
      },
     
    );
  }
}
