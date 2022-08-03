import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:task_by_roger_li/const/MyColors.dart';

class CustomImageView extends StatefulWidget {
  String imageUrl = "";
  double height = 30;
  double width = 30;

  CustomImageView(this.imageUrl, this.height, this.width);

  @override
  _CustomImageViewState createState() =>
      _CustomImageViewState(this.imageUrl, this.height, this.width);
}

class _CustomImageViewState extends State<CustomImageView> {
  String imageUrl = "";
  double height = 50;
  double width = 50;

  _CustomImageViewState(this.imageUrl, this.height, this.width);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            borderRadius: new BorderRadius.only(
              topLeft: const Radius.circular(8.0),
              topRight: const Radius.circular(8.0),
              bottomLeft: const Radius.circular(8.0),
              bottomRight: const Radius.circular(8.0),
            ),
            image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
                colorFilter:
                    ColorFilter.mode(Colors.white, BlendMode.colorBurn)),
          ),
        ),
        placeholder: (context, url) => CircularProgressIndicator(),
        errorWidget: (context, url, error) => Icon(Icons.image),
      ),
    );
  }
}
