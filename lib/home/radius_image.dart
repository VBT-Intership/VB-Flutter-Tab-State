import 'package:flutter/material.dart';

class RadiusImage extends StatelessWidget {
  final String imageUrl;

  const RadiusImage({Key key, @required this.imageUrl}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Image.network(
            imageUrl,
            fit: BoxFit.fill,
          )),
    );
  }
}
