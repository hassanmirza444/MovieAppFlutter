import 'dart:convert';

import '../models/models.dart';
import 'package:http/http.dart'as  http;
class FetchUserService{

  Future<List<Result>> fetchUsers(int page) async {
    print("Fetch users");
    final url = 'https://randomuser.me/api/?results=10&page=$page';
    print(url);
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if(response.statusCode == 200){
      final body = response.body;
      Map<String, dynamic> jsonMap = json.decode(body);
      Root root = Root.fromJson(jsonMap);
      print("Fetch users completed");
      return root.results as  List<Result>;
    }else{
      return [];
    }

  }


}