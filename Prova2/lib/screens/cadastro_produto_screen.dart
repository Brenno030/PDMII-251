import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/produto.dart';
import '../providers/dados_provider.dart';

class CadastroProdutoScreen extends StatefulWidget {
  const CadastroProdutoScreen({super.key});

  @override
  State<CadastroProdutoScreen> createState() => _CadastroProdutoScreenState();
}

class _CadastroProdutoScreenState extends State<CadastroProdutoScreen> {
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
              decoration: const InputDecoration(labelText: 'Nome do Produto'),
            ),
            TextField(
              controller: _descricaoController,
              decoration: const InputDecoration(labelText: 'Descrição'),
            ),
            TextField(
              controller: _precoController,
              decoration: const InputDecoration(labelText: 'Preço'),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final nome = _nomeController.text;
                final descricao = _descricaoController.text;
                final precoTexto = _precoController.text;

                if (nome.isEmpty || descricao.isEmpty || precoTexto.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Preencha todos os campos')),
                  );
                  return;
                }

                final preco = double.tryParse(precoTexto);
                if (preco == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Preço inválido')),
                  );
                  return;
                }

                final novoProduto = Produto(
                  nome: nome,
                  descricao: descricao,
                  preco: preco,
                );

                dadosProvider.adicionarProduto(novoProduto);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Produto cadastrado!')),
                );

                _nomeController.clear();
                _descricaoController.clear();
                _precoController.clear();
              },
              child: const Text('Salvar'),
            ),
            const SizedBox(height: 20),
            const Text(
              'Produtos Cadastrados:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: dadosProvider.produtos.length,
                itemBuilder: (_, index) {
                  final produto = dadosProvider.produtos[index];
                  return ListTile(
                    title: Text(produto.nome),
                    subtitle: Text('${produto.descricao} - R\$ ${produto.preco.toStringAsFixed(2)}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
