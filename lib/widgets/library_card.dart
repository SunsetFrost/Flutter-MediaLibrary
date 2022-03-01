import 'package:flutter/material.dart';
import 'package:media_library/pages/book/routes.dart' as book_routes;

class LibraryCard extends StatelessWidget {
  const LibraryCard({
    Key? key,
    required this.name,
    required this.desc,
    required this.iconType,
    this.path = '',
    this.color = Colors.blueAccent,
    this.colorDark = Colors.blue,
    this.colorLight = Colors.blue,
    this.width = double.infinity,
    this.height = 90,
  }) : super(key: key);

  final String name;
  final String desc;
  final String path;
  final Color color;
  final Color colorDark;
  final Color colorLight;
  final double width;
  final double height;
  final IconData iconType;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          if (path == '') {
            return;
          }
          // else if (path == book_routes.listRoute) {
          //   ScaffoldMessenger.of(context).showSnackBar(
          //     SnackBar(
          //       content: Text(
          //         'Book Page Coming soon!',
          //         style: TextStyle(color: Theme.of(context).cardColor),
          //       ),
          //       // action: SnackBarAction(
          //       //   label: 'Action',
          //       //   onPressed: () {
          //       //     // Code to execute.
          //       //   },
          //       // ),
          //       backgroundColor: colorLight,
          //       margin: EdgeInsets.symmetric(horizontal: 12.0),
          //       behavior: SnackBarBehavior.floating,
          //       shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(10.0),
          //       ),
          //     ),
          //   );
          // }
          else {
            Navigator.of(context).pushNamed(path);
          }
        },
        child: Container(
          width: width,
          height: height,
          child: Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
            child: Row(children: <Widget>[
              SizedBox(
                width: 10.0,
              ),
              Container(
                // margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: colorLight,
                  border: Border.all(color: colorLight),
                  shape: BoxShape.circle,
                  // border: Border.all(width: 2, color: color),
                ),
                child: Icon(
                  iconType,
                  color: color,
                  size: 20.0,
                ),
              ),
              SizedBox(
                width: 20.0,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      color: Theme.of(context).cardColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 6.0,
                  ),
                  Text(desc,
                      style: TextStyle(
                        color: Theme.of(context).secondaryHeaderColor,
                        fontSize: 12,
                      ))
                ],
              ),
              Expanded(child: SizedBox()),
              Icon(
                Icons.navigate_next,
                color: Theme.of(context).secondaryHeaderColor,
              ),
              SizedBox(
                width: 10.0,
              )
            ]),
          ),
        ));
  }
}
