import 'dart:async';
import 'dart:convert';

import 'package:ebook/ChoiceCard.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:toast/toast.dart';

import '../Styles.dart';
import '../WikipediaExplorer.dart';

class BookListScreen extends StatefulWidget {
  final Choice choice;

  BookListScreen({Key key, @required this.choice}) : super(key: key);

  @override
  _BookListScreenState createState() => _BookListScreenState(choice);
}

class _BookListScreenState extends State<BookListScreen> {
  final Choice choice;
  Map data;
  List itemsBook;
  var _isLoading = true;

  _BookListScreenState(this.choice);

  Future getBookList(String key) async {
    http.Response response = await http.get(
        "https://www.googleapis.com/books/v1/volumes?maxResults=10&key=AIzaSyC5gSOScPvSCrPssIez0VRSPXHfDsH7bUY&q=" +
            key);
    data = json.decode(response.body.toString());
    setState(() {
      itemsBook = data == null ? null : data["items"];
    });
    _isLoading = false;
//    debugPrint("----------->>> " + itemsBook.toString());
  }

  @override
  void initState() {
    super.initState();
    getBookList(choice.title);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.red,
            title: Text(
              choice.title + " Books",
              style: Styles.navBarTitle,
            )),
        body: _isLoading
            ? new Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new CircularProgressIndicator(
                      backgroundColor: Colors.greenAccent.shade700,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: Text(
                        "Please wait...",
                        style: TextStyle(fontSize: 24.0, color: Colors.black),
                      ),
                    )
                  ],
                ),
              )
            : ListView.builder(
                itemCount: itemsBook == null ? 0 : itemsBook.length,
                itemBuilder: _listViewItemBuilder));
  }

  Widget _listViewItemBuilder(BuildContext context, int index) {
    var booksDetail = itemsBook[index]["volumeInfo"];
    if (booksDetail != null) {
      return Card(
          elevation: 5.0,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: ListTile(
                contentPadding: EdgeInsets.all(10.0),
                leading: _itemThumbnail(booksDetail),
                title: _itemTitle(booksDetail),
                onTap: () {
                  _navigationToNewsDetail(
                      context, itemsBook[index]["accessInfo"]);
                }),
          ));
    } else {
      return Container(
        child: Center(
            child: Text(
          "No List Found!!",
          style: TextStyle(fontSize: 25.0),
        )),
      );
    }
  }

  void _navigationToNewsDetail(BuildContext context, var bookinfo) {
    String url = bookinfo["webReaderLink"];

    if (null != url) {
      debugPrint("----- url-> $url");
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => WikipediaExplorer(url)));
    } else {
      Toast.show("url is null", context,
          duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
    }
  }

  Widget _itemThumbnail(var bookDetails) {
    return Container(
      constraints: BoxConstraints.tightFor(width: 100.0),
      child: bookDetails == null
          ? null
          : Image.network(bookDetails["imageLinks"]["thumbnail"],
              fit: BoxFit.fitWidth),
    );
  }

  Widget _itemTitle(var bookDetail) {
    var title = bookDetail == null ? "" : bookDetail["title"];
    var publisherName = bookDetail == null ? "" : bookDetail["publisher"];
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Center(
              child: Text(title ?? "Latest Book", style: Styles.normalLarge)),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Text(publisherName ?? "",
              textAlign: TextAlign.right, style: Styles.textDefault),
        ),
      ],
    );
  }
}
