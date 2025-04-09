import 'package:flutter/material.dart';

class ConfigView extends StatelessWidget {
  const ConfigView({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'Configurações',
          style: TextStyle(
        fontSize: 20,
        color: Colors.white,
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.white, // Define a cor da seta para voltar
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.language),
            title: Text('Idioma'),
            subtitle: Text('Selecione o idioma do aplicativo'),
            onTap: () {
              // Navegar para a tela de seleção de idioma
            },
          ),
          ListTile(
            leading: Icon(Icons.volume_up),
            title: Text('Som'),
            subtitle: Text('Configurações de som'),
            onTap: () {
              // Navegar para a tela de configurações de som
            },
          ),
          ListTile(
            leading: Icon(Icons.help_outline),
            title: Text('Dúvidas Frequentes'),
            subtitle: Text('Veja respostas para perguntas comuns'),
            onTap: () {
              // Navegar para a tela de dúvidas frequentes
            },
          ),
          ListTile(
            leading: Icon(Icons.security),
            title: Text('Segurança'),
            subtitle: Text('Configurações de segurança'),
            onTap: () {
              // Navegar para a tela de dúvidas frequentes
            },
          ),
          ListTile(
            leading: Icon(Icons.info_outline),
            title: Text('Sobre'),
            subtitle: Text('Informações sobre o aplicativo'),
            onTap: () {
              // Navegar para a tela de informações sobre o app
              Navigator.pushNamed(context, 'sobre');
            },
          ),
        ],
      ),
    );
  }
}