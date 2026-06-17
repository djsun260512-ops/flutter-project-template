import 'package:dio/dio.dart';
import '../../../../core/network/dio_client.dart';
import '../models/login_request.dart';

class AuthRepo {
  final Dio _dio = DioClient().dio;

  Future<String> login(String username, String password) async {
    try {
      final request = LoginRequest(username: username, password: password);
      final response = await _dio.post('/auth/login', data: request.toJson());
      // 假设返回数据为 { "data": { "token": "xxx" } }
      return response.data['data']['token'];
    } catch (e) {
      rethrow; // 由 controller 捕获处理
    }
  }
}