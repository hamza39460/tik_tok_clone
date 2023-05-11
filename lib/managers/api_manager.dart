import 'package:dio/dio.dart';

class APIManager {
  APIManager._internal();

  factory APIManager() => _selfInstance;

  static final APIManager _selfInstance = APIManager._internal();

  final _dio = Dio();

  Future<Response> get(String url) async {
    try {
      return await _dio.get(
        url,
        options: Options(
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
          },
        ),
      );
    } on Exception catch (_) {
      rethrow;
    }
  }
}
