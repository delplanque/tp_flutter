import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:async/async.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';


import './screens/medecins.dart'  as _medecinsPage;
import './screens/patients.dart'  as _patientsPage;
import './screens/home.dart'      as _homePage;

void main() => runApp(new MaterialApp(
  title: 'EasyRDV',
  theme: new ThemeData(
      primarySwatch: Colors.blueGrey,
      scaffoldBackgroundColor: Colors.white,
      primaryColor: Colors.blueGrey, backgroundColor: Colors.white
  ),
  home: RedirectHome(),
  onGenerateRoute: (RouteSettings settings) {
    switch (settings.name) {
      case '/home': return new FromRightToLeft(
        builder: (_) => new RedirectHome(),
        settings: settings,
      );
      case '/medecins': return new FromRightToLeft(
        builder: (_) => new _medecinsPage.Medecins(),
        settings: settings,
      );
      case '/patients': return new FromRightToLeft(
        builder: (_) => new _patientsPage.Patients(),
        settings: settings,
      );
    }
  },
));

class FromRightToLeft<T> extends MaterialPageRoute<T> {
  FromRightToLeft({ WidgetBuilder builder, RouteSettings settings })
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {

    if (settings.isInitialRoute)
      return child;

    return new SlideTransition(
      child: new Container(
        decoration: new BoxDecoration(
            boxShadow: [
              new BoxShadow(
                color: Colors.black26,
                blurRadius: 25.0,
              )
            ]
        ),
        child: child,
      ),
      position: new Tween<Offset>(
        begin: const Offset(1.0, 0.0),
        end: Offset.zero,
      )
          .animate(
          new CurvedAnimation(
            parent: animation,
            curve: Curves.fastOutSlowIn,
          )
      ),
    );
  }
  @override Duration get transitionDuration => const Duration(milliseconds: 400);
}

class RedirectHome extends StatefulWidget {
  @override
  RedirectHomeState createState() => new RedirectHomeState();
}

class RedirectHomeState extends State<RedirectHome> {

  PageController _tabController;

  var _title_app = null;
  int _tab = 0;

  @override
  void initState() {
    super.initState();

    print('XXXX-XXXXX');
    Stream<QuerySnapshot> stream1 = Firestore.instance.collection('medecins').snapshots();
    stream1.listen((snap){
      print(snap.documents.toList());
    });
    _tabController = new PageController();
    this._title_app = TabItems[0].title;
  }

  @override
  void dispose(){
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build (BuildContext context) => new Scaffold(

    //App Bar
      appBar: new AppBar(
        title: new Text(
          _title_app,
          style: new TextStyle(
            fontSize: Theme.of(context).platform == TargetPlatform.iOS ? 17.0 : 20.0,
          ),
        ),
        elevation: Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0,
      ),

      //Content of tabs
      body: new PageView(
        controller: _tabController,
        children: <Widget>[
          new _homePage.Home(),
        ],
      ),


      //DESIGN DU MENU
      drawer: new Drawer(
          child: new ListView(
            children: <Widget>[
              new Container(
                height: 120.0,
                child: new DrawerHeader(
                  padding: new EdgeInsets.all(0.0),
                  decoration: new BoxDecoration(
                    color: new Color(0xFFECEFF1),
                  ),
                  child: new Center(
                    child: new FlutterLogo(
                      colors: Colors.blueGrey,
                      size: 70.0,
                    ),
                  ),
                ),
              ),
              new ListTile(
                  leading: new Icon(Icons.home),
                  title: new Text('Home'),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.of(context).pushNamed('/home');
                  }
              ),
              new ListTile(
                  leading: new Icon(Icons.local_hospital),
                  title: new Text('Je suis Medecins'),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.of(context).pushNamed('/medecins');
                  }
              ),
              new ListTile(
                  leading: new Icon(Icons.assignment_ind),
                  title: new Text('Je suis Patients'),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.of(context).pushNamed('/patients');
                  }
              ),
              new Divider(),
            ],
          )
      )
  );

  void onTap(int tab){
    _tabController.jumpToPage(tab);
  }

}

class TabItem {
  const TabItem({ this.title, this.icon });
  final String title;
  final IconData icon;
}

const List<TabItem> TabItems = const <TabItem>[
  const TabItem(title: 'EasyRDV', icon: Icons.home)
];