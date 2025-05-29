import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:thuctapcoso/features/shop/models/banner_model.dart';

class BannerRepository {
  final _db = FirebaseFirestore.instance;

  Future<List<BannerModel>> getAllBanners() async {
    final snapshot = await _db.collection('Banners').get();
    return snapshot.docs
        .map((doc) => BannerModel.fromJson(doc.data()))
        .toList();
  }
}
