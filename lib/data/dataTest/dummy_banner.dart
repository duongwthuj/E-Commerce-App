import 'package:thuctapcoso/features/shop/models/banner_model.dart';
// import 'package:thuctapcoso/utlis/constants/image_strings.dart';

class TDummyBanner {
  static final List<BannerModel> banners = [
    BannerModel(
      imageUrl:
          'https://res.cloudinary.com/drs2qlys3/image/upload/v1748549512/vvdwemmbz6ltzk7xa94n.png',
      active: true,
      targetScreen: '/search',
    ),
    // BannerModel(
    //   imageUrl:
    //       'https://res.cloudinary.com/drs2qlys3/image/upload/v1748549512/rjw8bmndxkf6upjsurpv.png',
    //   active: true,
    //   targetScreen: '/search',
    // ),
    BannerModel(
      imageUrl:
          'https://res.cloudinary.com/drs2qlys3/image/upload/v1748549512/vvdwemmbz6ltzk7xa94n.png',
      active: false,
      targetScreen: '/search',
    ),
  ];
}
