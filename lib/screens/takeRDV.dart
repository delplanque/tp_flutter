import 'package:flutter/material.dart';

void main() => runApp(TakeRDV());

class TakeRDV extends StatelessWidget {

  // final medecin;
  // TakeRDV(this.medecin);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('test'),
      ),
      // body: _build(context, product),
      // body: Image.network(
      //   ''+product.image+'',
      //    fit: BoxFit.cover
      // ),
    );
  }

// Widget _build(BuildContext context, product) {
//   Widget titleSection = Container(
//     padding: const EdgeInsets.all(32.0),
//     child: Row(
//       children: [
//         Container(
//           margin: const EdgeInsets.only(top: 8.0),
//           child: Text(
//             'test',
//             style: TextStyle(
//               fontSize: 12.0,
//             ),
//           ),
//         ),
//       ],
//     ),
//   );
// }


}