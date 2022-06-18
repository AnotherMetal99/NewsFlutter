import 'package:dio/dio.dart';
import '../../constants/strings.dart';

class CategoriesWebServices {
  late Dio dio;

  CategoriesWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 20 * 1000, // 60 seconds,
      receiveTimeout: 20 * 1000,
    );

    dio = Dio(options);
  }

  Future<List<dynamic>> getAllCategories() async {
    try {
      Response response = await dio.get(baseUrl);
      print(response.data.toString());
      return response.data;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
