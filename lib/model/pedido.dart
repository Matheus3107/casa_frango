class Pedido {
  final String nome;
  final String pedidoId;
  final String fone;
  final String descrition;

  Pedido({this.descrition, this.fone, this.nome, this.pedidoId});

  Map<String, dynamic> toMap() {
    return {
      'pedidoId': pedidoId,
      'nome': nome,
      'fone': fone,
      'descrition': descrition
    };
  }

  Pedido.fromFirestore(Map<String, dynamic> firestoredocument)
      : pedidoId = firestoredocument['pedidoId'],
        nome = firestoredocument['nome'],
        fone = firestoredocument['fone'],
        descrition = firestoredocument['descrition'];
}
