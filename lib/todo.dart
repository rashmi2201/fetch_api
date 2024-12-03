import 'dart:convert';

import 'package:fetch_api/model/todo_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Todo extends StatefulWidget {
  const Todo({super.key});

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  List<TodoModel> todomodel = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown.shade400,
        title: Text('Todo API'),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: FutureBuilder(
          future: getresponse(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: todomodel.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        width: 500,
                        height: 130,
                        color: const Color.fromARGB(255, 155, 148, 227),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'User id: ${todomodel[index].userId}',
                              style: TextStyle(fontSize: 18),
                            ),
                            Text(
                              'Id: ${todomodel[index].id}',
                              style: TextStyle(fontSize: 18),
                            ),
                            Text(
                              'Title: ${todomodel[index].title}',
                              maxLines: 1,
                              style: TextStyle(fontSize: 18),
                            ),
                            Text(
                              'Completed: ${todomodel[index].completed}',
                              maxLines: 1,
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  );
                },
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }

  Future<List<TodoModel>> getresponse() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));

    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        todomodel.add(TodoModel.fromJson(index));
      }
      return todomodel;
    } else {
      return todomodel;
    }
  }
}
