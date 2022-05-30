import 'package:dio/dio.dart';

class DioHelper{
  final _apiKey = 'da9eff56f04440618ae2f9d6e61c4ebc';
  final Dio dio = Dio(
      BaseOptions(
        baseUrl: 'https://newsapi.org/',
        receiveDataWhenStatusError: true,
      )
  );


  Future<Response?>? _getData({
    required String path,
    required Map<String, dynamic> queryParameters
  }) async {
    return await dio.get(path, queryParameters: queryParameters);
  }

  Future<Response?>? getTopBusinessNews()
  async {
    return await _getData(
        path: 'v2/top-headlines',
        queryParameters: {
          'country':'eg',
          'category':'business',
          'apiKey':_apiKey
    }
    )?.then((value) {
      print(value);
    }).catchError((error) {
      print(error.toString());
    });
  }

}