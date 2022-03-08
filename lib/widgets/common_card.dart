import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CommonCard extends StatelessWidget {
  const CommonCard({
    Key? key,
    required this.name,
    required this.imagePath,
    this.aspect = 1.0,
    this.onClick,
    this.textColor = Colors.white,
  }) : super(key: key);

  final String name;
  final String imagePath;
  final void Function()? onClick;
  final num aspect;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    final cardWidth = MediaQuery.of(context).size.width / 3.2;
    final cardHeight = MediaQuery.of(context).size.width / 3.2 * aspect;

    return GestureDetector(
      onTap: onClick,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag: imagePath,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: CachedNetworkImage(
                  imageUrl: imagePath,
                  width: cardWidth,
                  height: cardHeight,
                  fit: BoxFit.cover,
                  alignment: Alignment.centerLeft,
                  placeholder: (context, url) => Container(
                    width: cardWidth,
                    height: cardHeight,
                    color: Colors.grey[300],
                  ),
                  errorWidget: (context, url, error) => Container(
                    width: cardWidth,
                    height: cardHeight,
                    color: Colors.red[100],
                  ),
                )),
          ),
          SizedBox(
            height: 6.0,
          ),
          Text(
            name,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: TextStyle(
              color: textColor,
              fontSize: 12.0,
            ),
          ),
        ],
      ),
    );
  }
}
