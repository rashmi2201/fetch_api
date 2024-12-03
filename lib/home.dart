import 'dart:convert';

import 'package:fetch_api/model/sample_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<SamplePost> samplePost = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade100,
        title: Text(' Fetched API'),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: FutureBuilder(
          future: getdata(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: samplePost.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        height: 130,
                        color: Colors.green.shade200,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'User id: ${samplePost[index].userId}',
                              style: TextStyle(fontSize: 18),
                            ),
                            Text(
                              'Id: ${samplePost[index].id}',
                              style: TextStyle(fontSize: 18),
                            ),
                            Text(
                              'Title: ${samplePost[index].title}',
                              maxLines: 1,
                              style: TextStyle(fontSize: 18),
                            ),
                            Text(
                              'Body: ${samplePost[index].body}',
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

  Future<List<SamplePost>> getdata() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        samplePost.add(SamplePost.fromJson(index));
      }
      return samplePost;
    } else {
      return samplePost;
    }
  }
}
