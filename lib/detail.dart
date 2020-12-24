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
            padding: const EdgeInsets.all(10),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Container(
                    child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                      new Padding(padding: const EdgeInsets.only(top: 5)),
                      new Padding(padding: const EdgeInsets.only(bottom: 10)),
                      new Text("${widget.list[widget.index]['judul']}",
                          style: new TextStyle(fontSize: 18)),
                      new Text(
                          "Penulis : ${widget.list[widget.index]['penulis']}",
                          style: new TextStyle(fontSize: 14)),
                      new Text(
                          "Dipost pada: ${widget.list[widget.index]['tgl']}",
                          style: new TextStyle(fontSize: 14)),
                    ])),
                new Padding(padding: const EdgeInsets.only(top: 10)),
                new Container(
                    child: new Flexible(
                  child: new SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: new Text(widget.list[widget.index]['isi'],
                        style: new TextStyle(fontSize: 12)),
                  ),
                )),
                // new Card(
                //     child: new Container(
                //   child: ListTile(
                //       subtitle:
                //           new Text(widget.list[widget.index]['komentar'])),
                // ))
              ],
            )));
  }
}
