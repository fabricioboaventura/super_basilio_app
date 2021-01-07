import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class TestesScreen extends StatelessWidget {
  @override


  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('Entrar'),
        centerTitle: true,
        actions: <Widget>[
          FlatButton(
            onPressed: (){
              Navigator.of(context).pushReplacementNamed('/signup');
            },
            textColor: Colors.white,
            child: const Text(
              'CRIAR CONTA',
              style: TextStyle(fontSize: 14),
            ),
          )
        ],
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: const Text(
            'TESTE /N TESTE',
            style: TextStyle(fontSize: 14),
          ),


        ),
      ),
    );
  }
}
