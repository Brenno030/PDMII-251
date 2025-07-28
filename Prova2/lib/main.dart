import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/cadastro_screnn.dart';
import 'package:provider/provider.dart';

import 'providers/dados_provider.dart';
import 'screens/login_screen.dart';
import 'screens/menu_screen.dart';
import 'screens/cadastro_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DadosProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sistema de Cadastros',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (_) => const LoginScreen(),
        '/menu': (_) => const MenuScreen(),
        '/cadastro': (_) => const CadastroScreen(),
      },
    );
  }
}
