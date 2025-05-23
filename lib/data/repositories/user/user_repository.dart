import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../anthentications/authentication_repository.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;
  final _auth = AuthenticationRepository.instance;

  Future<void> createUser(Map<String, dynamic> userData) async {
    try {
      final userId = _auth.currentUserUid;
      if (userId == null) throw Exception('User not authenticated');

      await _db.collection('Users').doc(userId).set({
        ...userData,
        'createdAt': FieldValue.serverTimestamp(),
        'updatedAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      throw Exception('Failed to create user: $e');
    }
  }

  Future<Map<String, dynamic>?> getUserData() async {
    try {
      final userId = _auth.currentUserUid;
      if (userId == null) throw Exception('User not authenticated');

      final doc = await _db.collection('users').doc(userId).get();
      return doc.data();
    } catch (e) {
      throw Exception('Failed to get user data: $e');
    }
  }

  Future<void> updateUserData(Map<String, dynamic> userData) async {
    try {
      final userId = _auth.currentUserUid;
      if (userId == null) throw Exception('User not authenticated');

      await _db.collection('Users').doc(userId).update({
        ...userData,
        'updatedAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      throw Exception('Failed to update user data: $e');
    }
  }

  Future<void> deleteUser() async {
    try {
      final userId = _auth.currentUserUid;
      if (userId == null) throw Exception('User not authenticated');

      await _db.collection('Users').doc(userId).delete();
    } catch (e) {
      throw Exception('Failed to delete user: $e');
    }
  }
}
