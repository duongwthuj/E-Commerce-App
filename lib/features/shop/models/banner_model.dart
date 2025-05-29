class BannerModel {
  final String imageUrl;
  final bool active;
  final String targetScreen;

  BannerModel({
    required this.imageUrl,
    required this.active,
    required this.targetScreen,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      imageUrl: json['ImageUrl'] ?? '',
      active: json['Active'] ?? false,
      targetScreen: json['TargetScreen'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ImageUrl': imageUrl,
      'Active': active,
      'TargetScreen': targetScreen,
    };
  }
}
