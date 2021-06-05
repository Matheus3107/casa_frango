import 'package:casa_frango/model/pedido.dart';
import 'package:casa_frango/providers/pedido_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditPedidoScreen extends StatefulWidget {
  final Pedido pedido;
  EditPedidoScreen([this.pedido]);

  @override
  _EditPedidoScreenState createState() => _EditPedidoScreenState();
}

class _EditPedidoScreenState extends State<EditPedidoScreen> {
  final nomecontroller = TextEditingController();
  final descritioncontroller = TextEditingController();
  final fonecontroller = TextEditingController();

  @override
  void initState() {
    if (widget.pedido == null) {
      //novo Pedido
      nomecontroller.text = "";
      descritioncontroller.text = "";
      fonecontroller.text = "";

      final pedidoprovider = Provider.of<PedidoModel>(context, listen: false);
      pedidoprovider.loadPedido(Pedido());
    } else {
      //Alterar pedido
      nomecontroller.text = widget.pedido.nome;
      descritioncontroller.text = widget.pedido.descrition;
      fonecontroller.text = widget.pedido.fone;

      final pedidoprovider = Provider.of<PedidoModel>(context, listen: false);
      pedidoprovider.loadPedido(widget.pedido);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final pedidoprovider = Provider.of<PedidoModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Editando Pedido"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            TextField(
              controller: nomecontroller,
              decoration: InputDecoration(hintText: 'Nome do Cliente'),
              onChanged: (value) => pedidoprovider.setNome(value),
            ),
            TextField(
              controller: descritioncontroller,
              decoration: InputDecoration(hintText: 'Descrição Pedido'),
              onChanged: (value) => pedidoprovider.setDescrition(value),
            ),
            TextField(
              controller: fonecontroller,
              decoration: InputDecoration(hintText: 'Telefone'),
              onChanged: (value) => pedidoprovider.setFone(value),
            ),
            SizedBox(
              height: 20.0,
            ),
            TextButton(
              onPressed: () {
                pedidoprovider.savePedido();
                Navigator.of(context).pop();
              },
              child: Text('Gravar'),
            ),
            (widget.pedido != null)
                ? TextButton(
                    onPressed: () {
                      pedidoprovider.removePedido(widget.pedido.pedidoId);
                      Navigator.of(context).pop();
                    },
                    child: Text("Finalizar/Exluir"),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
