import 'package:dio/dio.dart';
import 'package:ulearning_app/global.dart';

class HttpUtil {
  late Dio dio;
  static final HttpUtil _instance = HttpUtil._internal();

  factory HttpUtil() {
    //print("printing http instance");
    return _instance;
  }
  HttpUtil._internal() {
    BaseOptions options = BaseOptions(
      baseUrl: "http://127.0.0.1:8000",
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
      headers: {},
      contentType: "application/json: charset=utf-8",
      responseType: ResponseType.json,
    );

    dio = Dio(options);
  }

  Map<String, dynamic>? getAuthorizationHeader() {
    var headers = <String, dynamic>{};
    var accessToken = Global.storageService.getUserToken();
    if (accessToken.isNotEmpty) {
      headers['Authorization'] = 'Bearer $accessToken';
    }

    return headers;
  }

  post(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    // CancelToken? cancelToken,
    // void Function(int, int)? onSendProgress,
    // void Function(int, int)? onReceiveProgress,
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};

    Map<String, dynamic>? authorization = getAuthorizationHeader();

    if (authorization != null) {
      requestOptions.headers!.addAll(authorization);
    }

    var response = await dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
      options: requestOptions,
    );

    return response.data;
  }
}
