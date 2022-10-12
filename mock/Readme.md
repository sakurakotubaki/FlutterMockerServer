# json-serverを環境構築する方法
GithubのReadmeで紹介されています。<br>
[json-server](https://github.com/typicode/json-server)

## 環境構築
1. package.jsonを生成する
```
npm init -y
```
2. json-serverをインストールする
```
npm install -g json-server
```
3. db.jsonを作成する
```
touch.db.json
```
4. ダミーのデータをdb.jsonに書く
```json:db.json
{
  "bookList": [
    {
      "id": 1,
      "title": "BookListSample",
      "author": "Kboy"
    },
    {
      "id": 2,
      "title": "フリーランスの生き方",
      "author": "Daigo"
    },
    {
      "id": 3,
      "title": "ノマドになってどうなった?",
      "author": "Taisei"
    },
    {
      "id": 4,
      "title": "Flutter別荘の日常",
      "author": "fen"
    },
    {
      "id": 5,
      "title": "ソフトウェアエンジニアリング",
      "author": "イルカ"
    },
    {
      "id": 6,
      "title": "起業家の生き方",
      "author": "yuto315"
    },
    {
      "id": 7,
      "title": "リードエンジニアとは?",
      "author": "あっぷる中谷"
    },
    {
      "id": 8,
      "title": "人生とは何か?",
      "author": "JboyHashimoto"
    }
  ],
  "comments": [
    {
      "id": 1,
      "body": "some comment",
      "postId": 1
    }
  ],
  "profile": {
    "name": "typicode"
  }
}
```
5. json-serverを起動する
```
json-server --watch db.json
```
6. こちらのURLにアクセスするとdb.jsonのデータがブラウザに表示される
```
http://localhost:3000/bookList/
```
