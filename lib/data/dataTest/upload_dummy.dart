import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:thuctapcoso/data/dataTest/dummyData.dart';

Future<void> uploadCategoriesToFirestore() async {
  final db = FirebaseFirestore.instance;
  for (final category in TDummyData.categories) {
    await db.collection('Categories').doc(category.id).set({
      'Name': category.name,
      'image': category.image,
      'IsFeatured': category.isFeatured,
      'ParentId': category.parentId ?? '',
    });
  }
  print('Upload completed!');
}
