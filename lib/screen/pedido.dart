import 'package:casa_frango/model/pedido.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PedidoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pedidos = Provider.of<List<Pedido>>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Pedidos.'),
        actions: [
          IconButton(
            icon: Icon(
              Icons.add,
              size: 35,
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => null),
              );
            },
          ),
        ],
      ),
      body: (pedidos != null)
          ? ListView.builder(
              itemCount: pedidos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(pedidos[index].nome),
                  trailing: Text(pedidos[index].fone),
                  //trailing: Text(pedidos[index].data.toString()),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => EditProdutoScreen(pedidos[index]),
                      ),
                    );
                  },
                );
              },
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
