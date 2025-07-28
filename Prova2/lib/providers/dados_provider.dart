import 'package:flutter/material.dart';
import '../models/cliente.dart';
import '../models/produto.dart';

class DadosProvider extends ChangeNotifier {
  // Agora armazenamos objetos, não apenas Strings
  List<Cliente> clientes = [];
  List<Produto> produtos = [];
  List<String> fornecedores = []; // depois você pode criar o model
  List<String> pedidos = [];      // depois você pode criar o model

  // Método para adicionar cliente
  void adicionarCliente(Cliente novoCliente) {
    clientes.add(novoCliente);
    notifyListeners();
  }

  // Método para adicionar produto
  void adicionarProduto(Produto novoProduto) {
    produtos.add(novoProduto);
    notifyListeners();
  }

  // Se ainda quiser usar os genéricos por tipo (opcional)
  void adicionar(String tipo, String valor) {
    switch (tipo) {
      case 'fornecedor':
        fornecedores.add(valor);
        break;
      case 'pedido':
        pedidos.add(valor);
        break;
    }
    notifyListeners();
  }
}