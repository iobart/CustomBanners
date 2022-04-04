import 'package:custom_banners/src/model/banner_model.dart';
import "package:flutter/material.dart";
import 'package:cached_network_image/cached_network_image.dart';
import '../utils/activity_indicator.dart';

class CustomBanner extends StatelessWidget {
  final BannerModel? bannerModel;
  final Function(String)? onSendSite;
  final double? radius;
  const CustomBanner({
    Key? key,
    this.onSendSite,
    this.bannerModel,
    this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onSendSite!(bannerModel!.link!),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 6),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(radius!),
          child: CachedNetworkImage(
            imageUrl: bannerModel!.image!,
            placeholder: (context, url) => ActivityIndicator(),
            errorWidget: (context, url, error) => Container(
              decoration: new BoxDecoration(
                border: Border.all(width: 2),
                borderRadius: new BorderRadius.all(Radius.circular(10.0)),
                shape: BoxShape.rectangle,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error),
                  Text('No Custom Banner Found!',style: TextStyle(fontWeight: FontWeight.bold),)
                ],
              ),
            ),
            fit: BoxFit.fill,
            alignment: Alignment.topCenter,
          ),
        ),
      ),
    );
  }
}
