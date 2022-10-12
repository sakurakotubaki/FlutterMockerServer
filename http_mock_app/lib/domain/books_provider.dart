import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http_mock_app/model/model.dart';

// 自動でデータを再取得するよう設定するFutureProvider.
final booksProvider = FutureProvider<List<BookList>>((ref) async {
  // model.dartの関数を呼び出す.
  return fetchPosts();
});
