import 'dart:convert' as convert;
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

/// [mocker-serverから、データを取得するクラスを定義]
/// [JSONのデータの中のオブジェクトと同じ名前にする]
class BookList {
  final int id;
  final String title;
  final String author;

  // コンストラクターを定義
  BookList({required this.id, required this.title, required this.author});

  // 新しいインスタンスを作成し、jsonを解析してデータを
  // 新しいインスタンスに配置します。(公式を翻訳)
  BookList.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        author = json['author'];

  // インスタンスをマップに変換するtoJson()メソッド
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'author': author,
      };
}

/// [BookListを型に使いモックサーバーからデータを取得する関数.]
List<BookList> parseBook(String responseBody) {
  // 引数をキャストしてMap型に変換
  final parsed = convert.jsonDecode(responseBody).cast<Map<String, dynamic>>();
  // 配列をmapメソッドでループさせる。
  return parsed.map<BookList>((json) => BookList.fromJson(json)).toList();
}

// インターネットからデータを取得するメソッド
Future<List<BookList>> fetchPosts() async {
  const endpoint = 'http://localhost:3000/bookList/';
  var url = Uri.parse(endpoint);

  var response = await http.get(url);
  if (response.statusCode == 200) {
    // ステータスコードを表示する
    print('ステータスコード: ${response.statusCode}');
    // JSONのデータを表示する
    print('JSONのデータ:  ${response.body}');
    return compute(parseBook, response.body);
  } else {
    throw Exception('Failed to load book');
  }
}
