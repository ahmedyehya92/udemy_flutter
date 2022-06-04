import 'package:dio/dio.dart';

class DioHelper {
  final newsApiBaseUrl = 'https://newsapi.org/';
  final shoppingAppApiBaseUrl = 'https://student.valuxapps.com/api/';
  final _apiKey = 'da9eff56f04440618ae2f9d6e61c4ebc';
  final Dio dio = Dio(BaseOptions(
      baseUrl: 'https://student.valuxapps.com/api/',
      receiveDataWhenStatusError: true,
      headers: {'Content-Type': 'application/json'}));

  Future<Response?>? _getData(
      {required String path,
      required Map<String, dynamic> queryParameters}) async {
    return await dio.get(path, queryParameters: queryParameters);
  }

  Future<Response?>? _postData(
      {required String path,
      required Map<String, dynamic> data,
      Map<String, dynamic>? queryParameters,
      String? token}) async {
    dio.options.headers = {'lang': 'en', 'Authorization': token};
    return await dio.post(path, queryParameters: queryParameters, data: data);
  }

  Future<Response?>? getTopBusinessNews() async {
    return await _getData(path: 'v2/top-headlines', queryParameters: {
      'country': 'us',
      'category': 'business',
      'apiKey': _apiKey
    });
  }

  Future<Response?>? searchNews(String value) async {
    return await _getData(
        path: 'v2/everything',
        queryParameters: {'q': value, 'apiKey': _apiKey});
  }

  Future<Response?>? shoppingLogin(
      {required String email, required String password}) async {
    return await _postData(
        path: 'login', data: {'email': email, 'password': password});
  }
}