import 'package:flutter/material.dart';

class MyLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(80.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 150,
                height: 150,
                child: Image.asset('assets/images/login.jpg'),
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'E-mail',
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Senha',
                ),
                obscureText: true,
              ),
              SizedBox(
                height: 24,
              ),
              ElevatedButton(
                child: Text('ENTER'),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/home_screen');
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.orange,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
