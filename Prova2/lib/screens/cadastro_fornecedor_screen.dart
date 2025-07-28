import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/dados_provider.dart';

class CadastroFornecedorScreen extends StatefulWidget {
  const CadastroFornecedorScreen({super.key});

  @override
  State<CadastroFornecedorScreen> createState() => _CadastroFornecedorScreenState();
}

class _CadastroFornecedorScreenState extends State<CadastroFornecedorScreen> {
  final _nomeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final dadosProvider = Provider.of<DadosProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro de Fornecedores')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _nomeController,
              decoration: const InputDecoration(labelText: 'Nome do Fornecedor'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final nome = _nomeController.text;

                if (nome.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Preencha o nome')),
                  );
                  return;
                }

                dadosProvider.adicionar('fornecedor', nome);
                _nomeController.clear();

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Fornecedor cadastrado!')),
                );
              },
              child: const Text('Salvar'),
            ),
            const SizedBox(height: 20),
            const Text('Fornecedores Cadastrados:',
                style: TextStyle(fontWeight: FontWeight.bold)),
            Expanded(
              child: ListView.builder(
                itemCount: dadosProvider.fornecedores.length,
                itemBuilder: (_, index) {
                  final nome = dadosProvider.fornecedores[index];
                  return ListTile(title: Text(nome));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
