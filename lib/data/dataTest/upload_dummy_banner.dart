import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:thuctapcoso/data/dataTest/dummy_banner.dart';

Future<void> uploadBannersToFirestore() async {
  final db = FirebaseFirestore.instance;
  for (final banner in TDummyBanner.banners) {
    await db.collection('Banners').add({
      'ImageUrl': banner.imageUrl,
      'Active': banner.active,
      'TargetScreen': banner.targetScreen,
    });
  }
  // print('Banner upload completed!');
}
