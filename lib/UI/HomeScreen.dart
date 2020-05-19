import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:toast/toast.dart';

import '../ChoiceCard.dart';
import 'BookListScreen.dart';
import 'about_us.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final title = "Grid List";
  var _selectedDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.red,
    ));

    return Scaffold(
      backgroundColor: Colors.white60,
      appBar: AppBar(
        title: Text("eBook"),
        backgroundColor: Colors.red,
      ),
      drawer: _appDrawer(),
      body: GridView.count(
          scrollDirection: Axis.vertical,
          crossAxisCount: 2,
          shrinkWrap: true,
          padding: EdgeInsets.all(3.0),
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 4.0,
          children: List.generate(choices.length, (index) {
            return GestureDetector(
              onTap: () {
                print("onTap called.$index, value---->" + choices[index].title);
                _navigateBook(choices[index]);
              },
              child: ChoiceCard(
                choice: choices[index],
              ),
            );
          })),
    );
  }

  void _navigateBook(Choice choice) {
    Toast.show(choice.title, context,
        duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => BookListScreen(choice: choice)),
    );
  }

  Widget _createDrawerItem(
      {IconData icon, String text, GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }

  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    _getDrawerItemScreen(_selectedDrawerIndex);
    Navigator.of(context).pop();
  }

  _getDrawerItemScreen(int pos) {
    return new FirstScreen();
  }

  Widget _appDrawer() {
    return Drawer(
      elevation: 1.5,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _createHeader(),
          _createDrawerItem(
              icon: Icons.home, text: 'Home', onTap: () => _onSelectItem(0)),
          _createDrawerItem(
              icon: Icons.info,
              text: 'About Us',
              onTap: () {
                Navigator.of(context).pop();
              }),
          _createDrawerItem(
              icon: Icons.info,
              text: 'Info',
              onTap: () {
                Navigator.of(context).pop();
              }),
          _createDrawerItem(
              icon: Icons.rate_review,
              text: 'Rate Us',
              onTap: () {
                Navigator.of(context).pop();
              }),
          _createDrawerItem(icon: Icons.exit_to_app, text: 'Exit'),
          ListTile(
            title: Text(' V-: 1.0.0  '),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _createHeader() {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.all(0.0),
        child: Stack(children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Colors.red,
            ),
            accountName: Text("eLearning App",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500)),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Theme.of(context).platform == TargetPlatform.iOS
                  ? new Color(0xFF0062ac)
                  : Colors.white,
              child: Icon(
                Icons.person,
                size: 50,
              ),
            ),
          ),
        ]));
  }
}
