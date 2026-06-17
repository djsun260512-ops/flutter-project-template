import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/dio_url.dart';

class DioClient {
  static final DioClient _instance = DioClient._internal();
  factory DioClient() => _instance;
  
  late Dio dio;

  DioClient._internal() {
    dio = Dio(BaseOptions(
      baseUrl: DioUrl.baseUrl, // 替换为实际地址
      contentType: 'application/json; charset=utf-8',
      responseType: ResponseType.json,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    ));

    // 添加拦截器：自动注入 Token
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        final prefs = await SharedPreferences.getInstance();
        final token = prefs.getString('access_token');
        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        return handler.next(options);
      },
      onError: (e, handler) {
        // 这里可以做全局错误处理（如 401 跳转登录）
        return handler.next(e);
      },
    ));
  }
}