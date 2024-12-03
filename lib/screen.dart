// import 'dart:convert';
// import 'package:fetch_api/model/demo_model.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class Screen extends StatefulWidget {
//   const Screen({super.key});

//   @override
//   State<Screen> createState() => _ScreenState();
// }

// class _ScreenState extends State<Screen> {
//   late Future<DemoPost> demoPostFuture;

//   @override
//   void initState() {
//     super.initState();
//     demoPostFuture = getData();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.amberAccent,
//         title: Text('Fetched API 2'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(8.0),
//         child: FutureBuilder<DemoPost>(
//           future: demoPostFuture,
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return Center(child: CircularProgressIndicator());
//             } else if (snapshot.hasError) {
//               return Center(child: Text('Error: ${snapshot.error}'));
//             } else if (snapshot.hasData) {
//               final demoPost = snapshot.data!;
//               return ListView.builder(
//                 itemCount: demoPost.data?.length ?? 0,
//                 itemBuilder: (context, index) {
//                   final item = demoPost.data![index];
//                   return Column(
//                     children: [
//                       Container(
//                         height: 130,
//                         color: Colors.green.shade200,
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               'Height ID: ${item.heightid}',
//                               style: TextStyle(fontSize: 18),
//                             ),
//                             Text(
//                               'Height: ${item.height}',
//                               style: TextStyle(fontSize: 18),
//                             ),
//                             Text(
//                               'Status: ${item.status}',
//                               style: TextStyle(fontSize: 18),
//                             ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(height: 10),
//                     ],
//                   );
//                 },
//               );
//             } else {
//               return Center(child: Text('No data available.'));
//             }
//           },
//         ),
//       ),
//     );
//   }

//   Future<DemoPost> getData() async {
//     final url = Uri.parse(
//         'https://www.eenadupellipandiri.net/eppservices/api_app/height');

//     try {
//       final response = await http.get(
//         url,
//         headers: {
//           'Authorization': 'Bearer YOUR_API_KEY_HERE',
//           'Content-Type': 'application/json',
//         },
//       );

//       print('Response Status: ${response.statusCode}');
//       print('Response Body: ${response.body}');

//       if (response.statusCode == 200) {
//         final jsonData = jsonDecode(response.body);

//         if (jsonData['status'] == 0) {
//           throw Exception(
//               'API Error: ${jsonData['errorDetails'][0]['errorDescription']}');
//         }

//         return DemoPost.fromJson(jsonData);
//       } else {
//         throw Exception('Failed to fetch data: ${response.statusCode}');
//       }
//     } catch (e) {
//       print('Error: $e');
//       throw Exception('An error occurred: $e');
//     }
//   }
// }
