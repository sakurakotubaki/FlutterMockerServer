# FlutterでHTTP通信を行うデモアプリ

domainフォルダに、providerのファイルを作成する。modelのフォルダに、mock-serverから、
データを取得するためのロジックを書く。
main.dartでFutureProviderを使って、mock-serverの全てのデータを取得して、ダミーのデータを
ListView.builder画面に描画する。

