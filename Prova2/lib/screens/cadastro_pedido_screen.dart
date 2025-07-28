import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/dados_provider.dart';

class CadastroPedidoScreen extends StatefulWidget {
  const CadastroPedidoScreen({super.key});

  @override
  State<CadastroPedidoScreen> createState() => _CadastroPedidoScreenState();
}

class _CadastroPedidoScreenState extends State<CadastroPedidoScreen> {
  final _descricaoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final dadosProvider = Provider.of<DadosProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro de Pedidos')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _descricaoController,
              decoration: const InputDecoration(labelText: 'Descrição do Pedido'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final descricao = _descricaoController.text;

                if (descricao.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Preencha a descrição')),
                  );
                  return;
                }

                dadosProvider.adicionar('pedido', descricao);
                _descricaoController.clear();

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Pedido cadastrado!')),
                );
              },
              child: const Text('Salvar'),
            ),
            const SizedBox(height: 20),
            const Text('Pedidos Cadastrados:',
                style: TextStyle(fontWeight: FontWeight.bold)),
            Expanded(
              child: ListView.builder(
                itemCount: dadosProvider.pedidos.length,
                itemBuilder: (_, index) {
                  final pedido = dadosProvider.pedidos[index];
                  return ListTile(title: Text(pedido));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
