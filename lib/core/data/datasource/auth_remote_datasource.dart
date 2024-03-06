import 'package:dio/dio.dart';

import '../../constants/constant.dart';
import '../models/auth_response_model.dart';

class AuthRemoteDataSource {
  final Dio dio = Constant.dio;
  Future<AuthResponseModel> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await dio.post(
        '/login',
        data: {
          'email': email,
          'password': password,
        },
      );

      return AuthResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
