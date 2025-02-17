import 'package:flutter_swiper_null_safety_flutter3/flutter_swiper_null_safety_flutter3.dart';
import 'package:url_launcher/url_launcher.dart';
import '../model/banner_model.dart';
import 'custom_banner_widget.dart';
import "package:flutter/material.dart";

class CustomBannersBase extends StatelessWidget {
  final double heightBanner;
  final List<BannerModel> listBanners;
  final bool autoplay;
  final double radius;

  CustomBannersBase({
    this.heightBanner = 175.0,
    required this.listBanners,
    this.autoplay = false,
    required this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return listBanners.isEmpty
        ? SizedBox()
        : Container(
      key: Key('listBanners'),
      height: heightBanner,
      margin: EdgeInsets.only(top: 0, bottom: 20),
      child: Swiper(
        autoplay: autoplay,
        loop: false,
        viewportFraction: 0.85,
        containerHeight: heightBanner,
        itemHeight: heightBanner,
        itemBuilder: (BuildContext context, int index) =>
            CustomBanner(
              radius: radius,
              bannerModel: listBanners[index],
              onSendSite: _launchURL,
            ),
        itemCount: listBanners.length,
      ),
    );
  }

  void _launchURL(String url) async {
    try {
      final Uri uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else {
        throw 'Could not launch $url';
      }
    } catch (e) {
      throw 'An unexpected error occurred: $e';
    }
  }
}