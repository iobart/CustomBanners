class BannerModel {
  String? link;
  String? image;

  BannerModel({
    this.link,
    this.image,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
        link: json["link"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "link": link,
        "image": image,
      };
}
