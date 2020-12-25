import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './detail.dart';
import './kategori.dart';

void main() {
  runApp(new MaterialApp(
    title: "Aurora",
    home: new Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  Future<List> getData() async {
    final response = await http
        .get("http://10.0.2.2//WebDinamis/webservices/get_recent_post.php");
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.yellow[800],
        leading: new IconButton(
          icon: new Icon(Icons.category),
          onPressed: () {
            Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => new Kategori()));
          },
        ),
        title: new Center(child: Text("Aurora")),
        actions: <Widget>[new Icon(Icons.search)],
      ),
      body: new FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? new ItemList(list: snapshot.data)
              : new Center(
                  child: new CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final List list;
  ItemList({this.list});
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return Container(
          padding: const EdgeInsets.all(1),
          child: GestureDetector(
            onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => new Detail(
                      list: list,
                      index: i,
                    ))),
            child: new Card(
              child: Container(
                padding: const EdgeInsets.all(5),
                child: new ListTile(
                  title: new Text(list[i]['judul']),
                  leading: new Icon(Icons.book),
                  subtitle: new Text(
                      "Penulis : ${list[i]['penulis']}\nDipost pada : ${list[i]['tgl']}"),
                  //subtitle: new Text("Dipost pada : ${list[i]['tgl_insert']}"),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
