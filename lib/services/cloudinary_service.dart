import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CloudinaryService {
  static final CloudinaryService _instance = CloudinaryService._internal();
  factory CloudinaryService() => _instance;
  CloudinaryService._internal();

  final String cloudName = 'drs2qlys3';
  final String apiKey = '775892469975684';
  final String apiSecret = '7SNpxHg5_wgMsd2VScLGpW7vz8Q';
  final String uploadPreset = 'ml_default';

  Future<String> uploadProfileImage(File imageFile) async {
    try {
      print('Starting upload to Cloudinary...'); // Debug log

      // Create multipart request
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('https://api.cloudinary.com/v1_1/$cloudName/image/upload'),
      );

      // Add file to request
      request.files.add(
        await http.MultipartFile.fromPath(
          'file',
          imageFile.path,
        ),
      );

      // Add upload preset and credentials
      request.fields.addAll({
        'upload_preset': uploadPreset,
        'api_key': apiKey,
        'timestamp': DateTime.now().millisecondsSinceEpoch.toString(),
      });

      // Send request
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        print('Upload successful: ${jsonResponse['secure_url']}'); // Debug log
        return jsonResponse['secure_url'];
      } else {
        print('Upload failed with status: ${response.statusCode}');
        print('Response body: ${response.body}');
        throw Exception('Upload failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Cloudinary upload error: $e'); // Debug log
      throw Exception('Failed to upload profile image: $e');
    }
  }
}
