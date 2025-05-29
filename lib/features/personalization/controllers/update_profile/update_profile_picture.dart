import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:thuctapcoso/data/repositories/user/user_repository.dart';
import 'package:thuctapcoso/features/personalization/controllers/user_controllers.dart';
import 'package:thuctapcoso/services/cloudinary_service.dart';
import 'package:thuctapcoso/utlis/constants/image_strings.dart';
import 'package:thuctapcoso/utlis/popups/full_screen_loader.dart';
import 'package:thuctapcoso/utlis/popups/loaders.dart';


class UpdateProfilePictureController extends GetxController {
  static UpdateProfilePictureController get instance => Get.find();

  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  final cloudinaryService = CloudinaryService();
  final imagePicker = ImagePicker();

  Future<void> pickAndUploadImage() async {
    try {
      // Show loading
      TFullScreenLoader.openLoadingDialog('Updating profile picture...', TImages.docerAnimation);

      // Pick image
      final XFile? image = await imagePicker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
      );

      if (image == null) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Upload to Cloudinary
      final imageUrl =
          await cloudinaryService.uploadProfileImage(File(image.path));

      // Update user profile in Firestore
      await userRepository.updateSingleField({
        'ProfilePicture': imageUrl,
      });

      // Update the RX User value
      userController.user.value.profilePicture = imageUrl;

      // Refresh user data
      await userController.fetchUserRecord();

      // Remove loader
      TFullScreenLoader.stopLoading();

      // Show success message
      TLoaders.successSnackBar(
        title: 'Success',
        message: 'Profile picture updated successfully',
      );
    } catch (e) {
      // Remove loader
      TFullScreenLoader.stopLoading();

      // Show error message
      TLoaders.errorSnackBar(
        title: 'Error',
        message: 'Failed to update profile picture. Please try again.',
      );
    }
  }
}
