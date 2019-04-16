import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

///客户端请求数据
class HttpDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HttpDemo'),
        elevation: 0.0,
      ),
      body: HttpDemoHome(),
    );
  }
}

class HttpDemoHome extends StatefulWidget {
  @override
  _HttpDemoHomeState createState() => _HttpDemoHomeState();
}

class _HttpDemoHomeState extends State<HttpDemoHome> {
  @override
  void initState() {
    super.initState();
//    fetchPost();

    //json转字符串
    final post = {
      'title': 'hello',
      'description': 'Nine to meet you.',
    };
    print(post['title']);
    print(post['description']);

    final postJosn = jsonEncode(post);
    print(postJosn);
    //字符串转map
    final postJsonConverted = json.decode(postJosn);
    print(postJsonConverted['title']);
    print(postJsonConverted['description']);
    print(postJsonConverted is Map);

    final postModel = Post.fromJson(postJsonConverted);
    print('title:${postModel.title},description:${postModel.description}');

    print('${jsonEncode(postModel)}');

    fetchPosts().then((value) {
      return print(value);
    });
  }

  Future<List<Post>> fetchPosts() async {
    final response = await get('https://resources.ninghao.net/demo/posts.json');
//    print('statusCode:${response.statusCode}');
//    print('body:${response.body}');
    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);
      List<Post> posts = responseBody['posts'].map<Post>((item) {
        return Post.fromJson(item);
      }).toList();
      return posts;
    } else {
      throw Exception('failed to fetch posts.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Post {
  int id;
  String title;
  String description;
  String author;
  String imageUrl;
  Post(
    this.id,
    this.title,
    this.description,
    this.author,
    this.imageUrl,
  );

//   Post.fromJson(Map json)
//      : id = json['id'],
//        title = json['title'],
//        description = json['description'],
//        author = json['author'],
//        imageUrl = json['imageUrl'];
  Post.fromJson(Map json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    author = json['author'];
    imageUrl = json['imageUrl'];
  }

//  Map toJson() => {
//        'id': id,
//        'title': title,
//        'description': description,
//        'author': author,
//        'imageUrl': imageUrl,
//      };
  Map toJson() {
    final Map returnData = Map();
    returnData['id'] = id;
    returnData['title'] = title;
    returnData['description'] = description;
    returnData['author'] = author;
    returnData['imageUrl'] = imageUrl;
  }
}
