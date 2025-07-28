import 'package:flutter/material.dart';
import '../models/cliente.dart';

class ClienteProvider extends ChangeNotifier {
  final List<Cliente> _clientes = [];

  List<Cliente> get clientes => List.unmodifiable(_clientes);

  void adicionarCliente(Cliente cliente) {
    _clientes.add(cliente);
    notifyListeners();
  }

  void removerCliente(Cliente cliente) {
    _clientes.remove(cliente);
    notifyListeners();
  }

  void atualizarCliente(int index, Cliente clienteAtualizado) {
    if (index >= 0 && index < _clientes.length) {
      _clientes[index] = clienteAtualizado;
      notifyListeners();
    }
  }
}
