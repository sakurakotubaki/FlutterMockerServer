import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http_mock_app/domain/books_provider.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // このページで使用するriverpodを呼び出す変数を定義
    final value = ref.watch(booksProvider);

    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('mock-serverからデータを習得する'),
          backgroundColor: Colors.pinkAccent,
        ),
        body: Center(
          child: value.when(
              data: (books) {
                return ListView.builder(
                  // 配列のデータを描画するWidget
                  itemCount: books.length, // 配列の数をカウント
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(books[index].title), // 配列のtitleプロパティを表示
                      subtitle: Text(books[index].author), // 配列のauthorプロパティを表示
                    );
                  },
                );
              },
              // データが習得できなかったら、ローディングされる.
              error: (err, stack) => Center(child: Text(err.toString())),
              loading: () => const Center(child: CircularProgressIndicator())),
        ),
      ),
    );
  }
}
