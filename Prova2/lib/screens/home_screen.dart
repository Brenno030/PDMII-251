import 'package:flutter/material.dart';
import 'cadastro_screen.dart';
import 'produto_screen.dart';
// importe as outras telas conforme forem criadas

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Menu Principal')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CadastroClienteScreen()),
              );
            },
            child: const Text('Clientes'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ProdutosScreen()),
              );
            },
            child: const Text('Produtos'),
          ),
          ElevatedButton(
            onPressed: () {
              // Navigator.push para Fornecedores
            },
            child: const Text('Fornecedores'),
          ),
          ElevatedButton(
            onPressed: () {
              // Navigator.push para Pedidos
            },
            child: const Text('Pedidos'),
          ),
        ],
      ),
    );
  }
}
