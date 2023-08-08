import 'package:get/get_connect.dart';

import '../../../base/enviroment.dart';
import 'i_library_provider.dart';
import 'package:http/http.dart' as http;

class LibraryProvider extends GetConnect implements ILibraryProvider {
  @override
  void onInit() {
    httpClient.timeout = const Duration(seconds: 10);
    super.onInit();
  }

  @override
  Future<String> getAllBooks() async {
    try {
      final response = await http.get(
        Uri.parse('${AppEnviroment.baseUrl}/book/getAllBooks'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if (response.statusCode == 200) {
        return response.body;
      }
      return '';
    } catch (e) {
      rethrow;
    }
  }
}
