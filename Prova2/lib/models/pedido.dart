class Pedido {
  final String cliente;
  final String produto;
  final int quantidade;
  final DateTime data;

  Pedido({
    required this.cliente,
    required this.produto,
    required this.quantidade,
    required this.data,
  });
}
