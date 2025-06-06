import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:thuctapcoso/utlis/formatters/formatters.dart';

class UserModel {
  final String id;
  final String username;
  final String email;
  String firstName;
  String lastName;
  String phoneNumber;
  String profilePicture;
  String gender;
  String dateOfBirth;

  UserModel({
    required this.id,
    required this.username,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.profilePicture,
    this.gender = "",
    this.dateOfBirth = "",
  });

  String get fullName => '$firstName $lastName';

  String get formattedPhoneNumber => TFormatter.formatPhoneNumber(phoneNumber);

  static List<String> nameParts(fullName) => fullName.split(" ");

  static String generateUsername(fullName) {
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";
    String camelCaseUsername = "$firstName$lastName";
    String usernameWithPrefix = "cwt_$camelCaseUsername";
    return usernameWithPrefix;
  }

  static UserModel empty() => UserModel(
      id: "",
      firstName: "",
      lastName: "",
      username: "",
      email: "",
      phoneNumber: "",
      profilePicture: "",
      gender: "",
      dateOfBirth: "");

  // Chỉ lưu FirstName, LastName (chữ hoa đầu)
  Map<String, dynamic> toJson() {
    return {
      'FirstName': firstName,
      'LastName': lastName,
      'Username': username,
      'Email': email,
      'PhoneNumber': phoneNumber,
      'ProfilePicture': profilePicture,
      'Gender': gender,
      'DateOfBirth': dateOfBirth,
    };
  }

  // Chỉ đọc FirstName, LastName (chữ hoa đầu)
  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.exists) {
      final data = document.data()!;
      return UserModel(
        id: document.id,
        firstName: data['FirstName'] ?? "",
        lastName: data['LastName'] ?? "",
        username: data['Username'] ?? "",
        email: data['Email'] ?? "",
        phoneNumber: data['PhoneNumber'] ?? "",
        profilePicture: data['ProfilePicture'] ?? "",
        gender: data['Gender'] ?? "",
        dateOfBirth: data['DateOfBirth'] ?? "",
      );
    }
    return UserModel.empty();
  }
}
