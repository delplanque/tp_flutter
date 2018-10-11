import 'package:flutter/material.dart';

import './takeRDV.dart' as _takeRDVPage;

void main() => runApp(Patients());

class Patients extends StatelessWidget {

  @override
  Widget build (BuildContext context) => new Scaffold(

    //App Bar
      appBar: new AppBar(
        title: new Text(
          'Prendre RDV avec',
          style: new TextStyle(
            fontSize: Theme.of(context).platform == TargetPlatform.iOS ? 17.0 : 20.0,
          ),
        ),
        elevation: Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0,
      ),


      body: ListView(
        children: <Widget>[

          ListTile(
            trailing: new Icon(
              Icons.calendar_today,
            ),
            title: Text('Docteur test'),
            // onTap: () {
            //   _moreInformation();
            // },
          ),


        ],
      )
  );



// //TAKE A RDV
// void _moreInformation() {
//   BuildContext context;
//       Navigator.of(context).push(
//     new MaterialPageRoute<void>(
//       builder: (BuildContext context) {
//         return new _takeRDVPage.TakeRDV();
//       },
//     ),
//   );
// }


}