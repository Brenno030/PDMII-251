import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cliente.dart';
import '../providers/dados_provider.dart';

class CadastroClienteScreen extends StatefulWidget {
  const CadastroClienteScreen({super.key});

  @override
  State<CadastroClienteScreen> createState() => _CadastroClienteScreenState();
}

class _CadastroClienteScreenState extends State<CadastroClienteScreen> {
  final _nomeController = TextEditingController();
  final _cpfController = TextEditingController();
  final _emailController = TextEditingController();
  final _telefoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final dadosProvider = Provider.of<DadosProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro de Clientes')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _nomeController,
              decoration: const InputDecoration(labelText: 'Nome'),
            ),
            TextField(
              controller: _cpfController,
              decoration: const InputDecoration(labelText: 'CPF'),
            ),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _telefoneController,
              decoration: const InputDecoration(labelText: 'Telefone'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (_nomeController.text.isNotEmpty &&
                    _cpfController.text.isNotEmpty) {
                  final novoCliente = Cliente(
                    nome: _nomeController.text,
                    cpf: _cpfController.text,
                    email: _emailController.text,
                    telefone: _telefoneController.text,
                  );
                  dadosProvider.adicionarCliente(novoCliente);

                  // Limpa campos
                  _nomeController.clear();
                  _cpfController.clear();
                  _emailController.clear();
                  _telefoneController.clear();
                }
              },
              child: const Text('Salvar'),
            ),
            const SizedBox(height: 20),
            const Text('Clientes Cadastrados:', style: TextStyle(fontWeight: FontWeight.bold)),
            Expanded(
              child: PageView.builder(
                itemCount: dadosProvider.clientes.length,
                itemBuilder: (_, index) {
                  final cliente = dadosProvider.clientes[index];
                  return Card(
                    margin: const EdgeInsets.all(8),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Nome: ${cliente.nome}'),
                          Text('CPF: ${cliente.cpf}'),
                          Text('Email: ${cliente.email}'),
                          Text('Telefone: ${cliente.telefone}'),
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