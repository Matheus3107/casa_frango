import 'package:casa_frango/providers/pedido_model.dart';
import 'package:casa_frango/screen/edit_pedido_screen.dart';
import 'package:casa_frango/screen/home_screen.dart';
import 'package:casa_frango/screen/login.dart';
import 'package:casa_frango/screen/pedido.dart';
import 'package:casa_frango/services/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Firestoreservice = FirestoreService();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PedidoModel()),
        StreamProvider(create: (context) => Firestoreservice.getPedidos()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'chicken house',
        theme: ThemeData(primarySwatch: Colors.orange),
        initialRoute: '/',
        routes: {
          '/': (context) => MyLogin(),
          '/home_screen': (context) => HomeScreen(),
          '/pedido': (context) => PedidoScreen(),
          '/edit_pedido_screen': (context) => EditPedidoScreen(),
        },
      ),
    );
  }
}
