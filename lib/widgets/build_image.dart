import 'package:flutter/material.dart';

import '../constant.dart';

class BuildImage extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;
  final double radius;
  const BuildImage({
    Key? key,
    required this.imageUrl,
    required this.width,
    required this.height,
    required this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: FadeInImage(
          placeholder: AssetImage("assets/images/wait_image.jpg"),
          imageErrorBuilder: (context, url, error) => Image.asset(
            k_notImage,
            fit: BoxFit.cover,
          ),
          image: NetworkImage(
            imageUrl,
          ),
          width: width,
          height: height,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
