// ignore_for_file: file_names

import 'dart:async';
import 'package:http/http.dart' as http;
class API {
    static Future getUsers() async{

      final peticion = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    if (peticion.statusCode == 200)
    {
      return peticion;
    }

  else{
    throw Exception("La operacion no se realizo");
  }
  }
}