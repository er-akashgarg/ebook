import 'package:flutter/material.dart';

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key key, this.choice}) : super(key: key);
  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return Card(
        color: Colors.white,
        child: Center(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            //child: Image.asset('images/logo.png')
            Expanded(
              child: Image.asset('images/logo.png'),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 12),
              child: Text(choice.title,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0)),
            ),
          ],
        )));
  }
}

class Choice {
  const Choice({this.title, this.image});

  final String title;
  final Image image;
}

List<Choice> choices = <Choice>[
  Choice(title: 'Android', image: Image.asset('images/ic_android.jpeg')),
  Choice(title: 'IOS', image: Image.asset('images/ic_android.jpeg')),
  Choice(title: 'Java', image: Image.asset('images/ic_android.jpeg')),
  Choice(title: 'Java Script', image: Image.asset('images/ic_android.jpeg')),
  Choice(title: 'Flutter', image: Image.asset('images/ic_android.jpeg')),
  Choice(title: '.Net', image: Image.asset('images/ic_android.jpeg')),
  Choice(title: 'PHP', image: Image.asset('images/ic_android.jpeg')),
  Choice(title: 'Phython', image: Image.asset('images/ic_android.jpeg')),
  Choice(title: 'XML', image: Image.asset('images/ic_android.jpeg')),
  Choice(title: 'HTML', image: Image.asset('images/ic_android.jpeg')),
];
