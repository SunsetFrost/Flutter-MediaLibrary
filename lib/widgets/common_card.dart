import 'package:flutter/material.dart';

class CommonCard extends StatelessWidget {
  const CommonCard(
      {Key? key, required this.name, required this.imagePath, this.onClick})
      : super(key: key);

  final String name;
  final String imagePath;
  final void Function()? onClick;
  final num aspect = 1.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag: 'Poster' + name,
            child: imagePath == ''
                ? Container(
                    width: MediaQuery.of(context).size.width / 3.2,
                    height: MediaQuery.of(context).size.width / 3.2 * aspect,
                    margin: EdgeInsets.only(bottom: 6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: NetworkImage(imagePath), fit: BoxFit.fill),
                    ),
                  )
                : Container(
                    width: MediaQuery.of(context).size.width / 3.2,
                    height: MediaQuery.of(context).size.width / 3.2 * aspect,
                    decoration: BoxDecoration(color: Colors.amber),
                  ),
          ),
          Text(
            name,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12.0,
            ),
          ),
        ],
      ),
    );
  }
}
