import 'package:flutter/material.dart';

class CommonCard extends StatelessWidget {
  const CommonCard({
    Key? key,
    required this.name,
    required this.imagePath,
    this.aspect = 1.0,
    this.onClick,
  }) : super(key: key);

  final String name;
  final String imagePath;
  final void Function()? onClick;
  final num aspect;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag: 'Poster' + name,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                imagePath,
                width: MediaQuery.of(context).size.width / 3.2,
                height: MediaQuery.of(context).size.width / 3.2 * aspect,
                fit: BoxFit.fill,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }

                  return Container(
                    width: MediaQuery.of(context).size.width / 3.2,
                    height: MediaQuery.of(context).size.width / 3.2 * aspect,
                    color: Colors.grey[300],
                  );
                },
                errorBuilder: (context, object, stack) {
                  return Container(
                    width: MediaQuery.of(context).size.width / 3.2,
                    height: MediaQuery.of(context).size.width / 3.2 * aspect,
                    color: Colors.red[100],
                  );
                },
              ),
            ),
          ),
          SizedBox(
            height: 6.0,
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
