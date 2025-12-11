import 'package:flutter/material.dart';
import 'package:ujian_2410910040023_api/helper/todoList_helper.dart';
import 'package:ujian_2410910040023_api/models/todoList_model.dart';

class Todolist extends StatelessWidget {
  const Todolist({super.key});

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: Text("Todo List",style: TextStyle(fontWeight: FontWeight.bold),),
        backgroundColor: Colors.yellowAccent,
        foregroundColor: Colors.blueGrey,
      ),

      body: 
        FutureBuilder(
          future: TodolistHelper().getAllTodoList(), 
          builder: (context, snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(child: CircularProgressIndicator(),);
            }
            if (snapshot.hasData) {
              List<TodolistModel> todoList = snapshot.data!;
              return ListView.builder(
                itemCount: todoList.length,
                itemBuilder: (context, index){
                  return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(),
                    ),
                    padding: EdgeInsets.all(10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                  ),
                ); 
                }
              );
            }
          }
          )
    );
  }
}