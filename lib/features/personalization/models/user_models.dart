
class UserModel {
  final String id;
  final String firstName;
  final String lastName;
  final String username;
  final String email;
  final String phoneNumber;
  final String profilePicture;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture,
  });

  // Tách tên đầy đủ thành firstName và lastName
  static List<String> nameParts(String fullName) => fullName.split(' ');

  // Sinh username từ tên đầy đủ
  static String generateUsername(String fullName) {
    List<String> nameParts = fullName.split(' ');
    String first = nameParts[0].toLowerCase();
    String last = nameParts.length > 1 ? nameParts[1].toLowerCase() : '';
    return 'cwt_${first}${last}';
  }

  // Model rỗng
  static UserModel empty() => UserModel(
    id: '',
    firstName: '',
    lastName: '',
    username: '',
    email: '',
    phoneNumber: '',
    profilePicture: '',
  );

  // Chuyển model thành JSON với key viết hoa chữ cái đầu
  Map<String, dynamic> toJson() {
    return {
      'ID': id,
      'FirstName': firstName,
      'LastName': lastName,
      'Username': username,
      'Email': email,
      'PhoneNumber': phoneNumber,
      'ProfilePicture': profilePicture,
    };
  }

  // Tạo model từ JSON
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['ID'] ?? '',
      firstName: json['FirstName'] ?? '',
      lastName: json['LastName'] ?? '',
      username: json['Username'] ?? '',
      email: json['Email'] ?? '',
      phoneNumber: json['PhoneNumber'] ?? '',
      profilePicture: json['ProfilePicture'] ?? '',
    );
  }
}