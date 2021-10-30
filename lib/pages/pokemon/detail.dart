import 'package:flutter/material.dart';
import 'package:pokemon/pages/pokemon/routes.dart';

class PokemonDetail extends StatelessWidget {
  const PokemonDetail({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as DetailArguments;

    return Scaffold(
        backgroundColor: Color.fromRGBO(33, 35, 64, 1.0),
        body: SafeArea(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
              alignment: Alignment.topLeft,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Icon(Icons.arrow_back),
                // style: TextStyle(color: Colors.),
              )),
          Padding(
            padding: EdgeInsets.only(
              top: 20,
              // left: 12,
              bottom: 20,
            ),
            child: Text(
              '口袋图鉴',
              style: TextStyle(
                color: Color.fromRGBO(244, 176, 22, 1.0),
                fontFamily: 'IPix',
                fontSize: 19,
                fontWeight: FontWeight.w500,
                wordSpacing: 10,
              ),
            ),
          ),
        ])));
  }
}
