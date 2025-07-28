import '../lib/models.dart';
import 'dart:convert';

void main() {
  // Criando objetos
  Cliente cliente = Cliente(codigo: 1, nome: 'João Silva', tipoCliente: 2);
  Vendedor vendedor = Vendedor(codigo: 10, nome: 'Maria Souza', comissao: 0.15);
  Veiculo veiculo = Veiculo(codigo: 100, descricao: 'Carro Sedan', valor: 55000.0);

  List<ItemPedido> itens = [
    ItemPedido(sequencial: 1, descricao: 'Produto A', quantidade: 2, valor: 150.0),
    ItemPedido(sequencial: 2, descricao: 'Produto B', quantidade: 1, valor: 250.0),
  ];

  PedidoVenda pedido = PedidoVenda(
    codigo: 'PV001',
    data: DateTime.now(),
    valorPedido: 0, // Será calculado
    cliente: cliente,
    vendedor: vendedor,
    veiculo: veiculo,
    items: itens,
  );

  // Calcula o valor total do pedido
  pedido.valorPedido = pedido.calcularPedido();

  // Gera o JSON
  String jsonPedido = jsonEncode(pedido.toJson());

  print('JSON do PedidoVenda:\n$jsonPedido');
}
