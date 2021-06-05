import 'package:casa_frango/model/pedido.dart';
import 'package:casa_frango/services/firestore_service.dart';
import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

class PedidoModel extends ChangeNotifier {
  final Firestoreservice = FirestoreService();

  String _nome;
  String _pedidoId;
  String _fone;
  String _descrition;
  var uuid = Uuid();

  String get nome => _nome;
  String get fone => _fone;
  String get descrition => _descrition;

  setNome(String pnome) {
    _nome = pnome;
    notifyListeners();
  }

  setFone(String pfone) {
    _fone = pfone;
    notifyListeners();
  }

  setDescrition(String pdescrition) {
    _descrition = pdescrition;
    notifyListeners();
  }

  loadPedido(Pedido pedido) {
    _nome = pedido.nome;
    _fone = pedido.fone;
    _descrition = pedido.descrition;
    _pedidoId = pedido.pedidoId;
  }

  savePedido() {
    if (_pedidoId == null) {
      var novoPedido = Pedido(
          nome: nome, fone: fone, descrition: descrition, pedidoId: uuid.v4());
      Firestoreservice.savePedido(novoPedido);
    } else {
      //Update
      var alterapedido = Pedido(nome: nome, fone: fone, descrition: descrition);
      Firestoreservice.savePedido(alterapedido);
    }
  }

  removePedido(String pedidoId) {
    Firestoreservice.removePedido(pedidoId);
  }
}
