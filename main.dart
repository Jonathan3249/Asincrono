
import 'dart:convert';
import 'package:flutter/material.dart';
import 'API.dart';
import 'modelo.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ejemplo Programacion Asincrona',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyListScreen(),
    );
  }
}

class MyListScreen extends StatefulWidget {
  const MyListScreen({Key? key}) : super(key: key);

  @override
  createState() => _MyListScreenState();
}

class _MyListScreenState extends State {
  var users = <User>[];

  _getUsers() {
    API.getUsers().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        users = list.map((model) => User.fromJson(model)).toList();
      });
    });
  }

  @override
  initState() {
    super.initState();
    _getUsers();
  }

  @override
  dispose() {
    super.dispose();
  }

  @override
  build(context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Lista de Usuarios"),
        ),
        body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(users[index].name.toString()),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(users[index].email.toString()),
                  Text(users[index].lusername.toString())
                ],
              ),
              );
          },
        )
        );
  }
}