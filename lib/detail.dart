import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  List list;
  int index;
  Detail({this.index, this.list});
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
            backgroundColor: Colors.yellow[800],
            title: new Text("${widget.list[widget.index]['judul']}")),
        body: new Container(
            child: Center(
          child: new Card(
            child: new ListView(
              padding: const EdgeInsets.all(10),
              children: <Widget>[
                //Image.network(
                // "/data:image/jpeg;base64${widget.list[widget.index]['gambar']}"),
                new Container(
                    child: new Column(children: <Widget>[
                  new Padding(padding: const EdgeInsets.only(top: 5)),
                  new Padding(padding: const EdgeInsets.only(bottom: 10)),
                  new Text(widget.list[widget.index]['judul'],
                      textAlign: TextAlign.center,
                      style: new TextStyle(fontSize: 18)),
                  new Text("Penulis : ${widget.list[widget.index]['penulis']}",
                      style: new TextStyle(fontSize: 14)),
                  new Text("Dipost pada: ${widget.list[widget.index]['tgl']}",
                      style: new TextStyle(fontSize: 14)),
                ])),
                new Padding(padding: const EdgeInsets.only(top: 10)),
                new Container(
                  child: new Text(widget.list[widget.index]['isi'],
                      style: new TextStyle(fontSize: 12)),
                ),
                // new Card(
                //     child: new Container(
                //   child: ListTile(
                //       subtitle:
                //           new Text(widget.list[widget.index]['komentar'])),
                // ))
              ],
            ),
          ),
        )));
  }
}
