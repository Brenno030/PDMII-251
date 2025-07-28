import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/dados_provider.dart';

class CadastroScreen extends StatefulWidget {
  const CadastroScreen({super.key});

  @override
  State<CadastroScreen> createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final tipo = ModalRoute.of(context)!.settings.arguments as String;
    final dadosProvider = Provider.of<DadosProvider>(context);
    final lista = {
      'cliente': dadosProvider.clientes,
      'produto': dadosProvider.produtos,
      'fornecedor': dadosProvider.fornecedores,
      'pedido': dadosProvider.pedidos,
    }[tipo]!;

    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de ${tipo[0].toUpperCase()}${tipo.substring(1)}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Nome do $tipo'),
            ),
            ElevatedButton(
              onPressed: () {
                if (_controller.text.isNotEmpty) {
                  dadosProvider.adicionar(tipo, _controller.text);
                  _controller.clear();
                }
              },
              child: const Text('Salvar'),
            ),
            const SizedBox(height: 20),
            const Text(
              'Cadastrados:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: PageView.builder(
                itemCount: lista.length,
                itemBuilder: (_, index) => Card(
                  child: Center(child: Text(lista[index] as String )),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pop(context),
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}
