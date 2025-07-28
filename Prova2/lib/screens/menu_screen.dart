import 'package:flutter/material.dart';
import 'cadastro_screen.dart';
import 'cadastro_produto_screen.dart';
import 'cadastro_fornecedor_screen.dart';
import 'cadastro_pedido_screen.dart';


class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

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
                MaterialPageRoute(builder: (_) => const CadastroProdutoScreen()),
              );
            },
            child: const Text('Produtos'),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const CadastroFornecedorScreen()),
                );
              },
              child: const Text('Fornecedores'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const CadastroPedidoScreen()),
                );
              },
              child: const Text('Pedidos'),
            ),
        ],
      ),
    );
  }
}
