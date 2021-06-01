class Pedido {
  final String nome;
  final String pedidoId;
  final String fone;
  final DateTime data;

  Pedido({this.data, this.fone, this.nome, this.pedidoId});

  Map<String, dynamic> toMap() {
    return {'pedidoId': pedidoId, 'nome': nome, 'fone': fone, 'data': data};
  }

  Pedido.fromFirestore(Map<String, dynamic> firestoredocument)
      : pedidoId = firestoredocument['pedidoId'],
        nome = firestoredocument['nome'],
        fone = firestoredocument['fone'],
        data = firestoredocument['data'];
}
