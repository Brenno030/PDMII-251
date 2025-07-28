import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/produto.dart';
import '../providers/dados_provider.dart';

class ProdutosScreen extends StatefulWidget {
  const ProdutosScreen({super.key});

  @override
  State<ProdutosScreen> createState() => _ProdutosScreenState();
}

class _ProdutosScreenState extends State<ProdutosScreen> {
  final _nomeController = TextEditingController();
  final _descricaoController = TextEditingController();
  final _precoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final dadosProvider = Provider.of<DadosProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro de Produtos')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _nomeController,
              decoration: const InputDecoration(labelText: 'Nome'),
            ),
            TextField(
              controller: _descricaoController,
              decoration: const InputDecoration(labelText: 'Descrição'),
            ),
            TextField(
              controller: _precoController,
              decoration: const InputDecoration(labelText: 'Preço'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (_nomeController.text.isNotEmpty &&
                    _precoController.text.isNotEmpty) {
                  final novoProduto = Produto(
                    nome: _nomeController.text,
                    descricao: _descricaoController.text,
                    preco: double.tryParse(_precoController.text) ?? 0.0,
                  );
                  dadosProvider.adicionarProduto(novoProduto);

                  _nomeController.clear();
                  _descricaoController.clear();
                  _precoController.clear();
                }
              },
              child: const Text('Salvar'),
            ),
            const SizedBox(height: 20),
            const Text('Produtos Cadastrados:', style: TextStyle(fontWeight: FontWeight.bold)),
            Expanded(
              child: PageView.builder(
                itemCount: dadosProvider.produtos.length,
                itemBuilder: (_, index) {
                  final produto = dadosProvider.produtos[index];
                  return Card(
                    margin: const EdgeInsets.all(8),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Nome: ${produto.nome}'),
                          Text('Descrição: ${produto.descricao}'),
                          Text('Preço: R\$ ${produto.preco.toStringAsFixed(2)}'),
                        ],
                      ),
                    ),
                  );
                },
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
