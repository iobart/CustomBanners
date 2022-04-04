import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:url_launcher/url_launcher.dart';
import '../model/banner_model.dart';
import 'custom_banner_widget.dart';
import "package:flutter/material.dart";

class CustomBannersBase extends StatelessWidget {
  double heightbanner;
  List<BannerModel>listBanners;
  bool autoplay;
  double  radius;
  CustomBannersBase({this.heightbanner = 175.0,required  this.listBanners, this.autoplay=false,required this.radius});
  @override
  Widget build(BuildContext context) {
    return listBanners.isEmpty
        ? SizedBox()
        : Container(
            key:Key('listBanners'),
            height: heightbanner,
            margin: EdgeInsets.only(top: 0, bottom: 20),
            child: Swiper(
              autoplay: autoplay,
              loop: false,
              viewportFraction: 0.85,
              containerHeight: heightbanner,
              itemHeight: heightbanner,
              itemBuilder: (BuildContext context, int index) => CustomBanner(
                radius: radius,
                bannerModel: listBanners[index],
                onSendSite: _launchURL,
              ),
              itemCount: listBanners.length,
            ),
          );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
