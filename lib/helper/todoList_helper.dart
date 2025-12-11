import 'dart:convert';

import 'package:ujian_2410910040023_api/models/todoList_model.dart';
import 'package:http/http.dart' as http;

class TodolistHelper {
  Future<List<TodolistModel>> getAllTodoList()async{
    var uri = Uri.parse("https://dummyjson.com/todos");
    var respon = await http.get(uri);
    if(respon.statusCode == 201){
      List<dynamic> hasil = jsonDecode(respon.body);
      return hasil.map((json)=>TodolistModel.fromMap(json)).toList();
    }else{
      throw Exception("Koneksu buruk");
    }
  }
}