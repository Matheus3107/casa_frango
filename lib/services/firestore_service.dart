import 'package:casa_frango/model/pedido.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> savePedido(Pedido pedido) {
    return _db.collection('pedidos').doc(pedido.pedidoId).set(pedido.toMap());
  }

  Future<void> removePedido(String pedidoId) {
    return _db.collection('pedidos').doc(pedidoId).delete();
  }

  Stream<List<Pedido>> getPedidos() {
    return _db.collection('pedidos').snapshots().map((snapshot) =>
        snapshot.docs.map((document) => Pedido.fromFirestore(document.data())));
  }
}
