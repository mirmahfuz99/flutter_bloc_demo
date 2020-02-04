import 'dart:convert';
import 'package:flutter_bloc_demo/data/model/comments_model.dart';
import 'package:flutter_bloc_demo/res/strings.dart';
import 'package:http/http.dart' as http;


abstract class CommentsRepository {
  Future<List<Comments>> getComments();
}

class CommentsRepositoryImpl implements CommentsRepository {
  @override
  Future<List<Comments>> getComments() async{
    print("Inside_get_comments");
    var response = await http.get(AppString.commentsApiUrl);
    if(response.statusCode == 200){
      var jsonResponse = json.decode(response.body);
      CommentsList postsList = CommentsList.fromJson(jsonResponse);
      print("Name");
      print(postsList.comments.elementAt(0).name);
      return postsList.comments;
    }
    return null;
  }

}



