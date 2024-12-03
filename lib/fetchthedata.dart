import 'dart:convert';

import 'package:fetch_api/model/fetch_data_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Fetchthedata extends StatefulWidget {
  const Fetchthedata({super.key});

  @override
  State<Fetchthedata> createState() => _FetchthedataState();
}

class _FetchthedataState extends State<Fetchthedata> {
  List<FetchData> fetchdata = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'Fetch the Data',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: FutureBuilder(
          future: getthedata(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: fetchdata.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        height: 130,
                        width: 400,
                        color: Colors.amber.shade100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'User id: ${fetchdata[index].userId}',
                              style: TextStyle(fontSize: 18),
                            ),
                            Text(
                              ' id: ${fetchdata[index].id}',
                              style: TextStyle(fontSize: 18),
                            ),
                            Text(
                              'title: ${fetchdata[index].title}',
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
          }),
    );
  }

  Future<List<FetchData>> getthedata() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/albums'),
    );

    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        fetchdata.add(FetchData.fromJson(index));
      }

      return fetchdata;
    } else {
      return fetchdata;
    }
  }
}
