import 'dart:convert';
import 'package:flutter_bloc_demo/data/model/api_result_model.dart';
import 'package:flutter_bloc_demo/res/strings.dart';
import 'package:http/http.dart' as http;


abstract class PostRepository {
  Future<List<Posts>> getPosts();
}

class PostsRepositoryImpl implements PostRepository {
  @override
  Future<List<Posts>> getPosts() async{
    var response = await http.get(AppString.postApiUrl);
    if(response.statusCode == 200){
      var jsonResponse = json.decode(response.body);
      PostsList postsList = PostsList.fromJson(jsonResponse);
      return postsList.posts;
    }
    return null;
  }

}



