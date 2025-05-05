
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/UserList.dart';

class RemoteDataSource{

   final http.Client client;

   RemoteDataSource({required this.client});

   Future<List<UserList>> fetchPosts() async {
     final response = await client.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
     if (response.statusCode == 200) {
       List<dynamic> jsonList = json.decode(response.body);
       return jsonList.map((json) => UserList.fromJson(json)).toList();
     } else {
       throw Exception('Failed to load posts');
     }

   }



}

