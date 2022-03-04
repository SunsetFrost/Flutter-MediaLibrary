import 'package:flutter/material.dart';

class PokemonTheme extends StatelessWidget {
  const PokemonTheme({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    // return PokemonList();
    return Container(
      child: Theme(
        child: child,
        data: Theme.of(context).copyWith(
            scaffoldBackgroundColor: Color.fromRGBO(33, 35, 64, 1.0),
            // fontFamily: 'IPix',
            backgroundColor: Color.fromRGBO(33, 35, 64, 1.0),
            primaryColor: Color.fromRGBO(244, 176, 22, 1.0),
            cardColor: Color.fromRGBO(40, 44, 82, 1.0),
            colorScheme:
                ColorScheme.fromSwatch().copyWith(secondary: Colors.white),
            textTheme: TextTheme(
              headline2: TextStyle(
                color: Colors.white,
                // color: Color.fromRGBO(244, 176, 22, 1.0),
                fontSize: 28,
                fontWeight: FontWeight.w500,
                wordSpacing: 10,
              ),
              // card name
              headline4: TextStyle(
                color: Color.fromRGBO(190, 193, 215, 1.0),
                fontSize: 12,
              ),
              headline5: TextStyle(
                  color: Color.fromRGBO(190, 193, 215, 1.0), fontSize: 10),
              headline6: TextStyle(
                color: Color.fromRGBO(244, 176, 22, 1.0),
                fontSize: 12,
              ),
            )),
      ),
    );
  }
}
