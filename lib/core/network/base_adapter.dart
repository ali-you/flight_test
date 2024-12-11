import 'package:golrang_task/core/network/response.dart';

abstract class BaseAdapter {
  Future<Response> get(
      {required String url, Map<String, dynamic>? header, int retryNumber = 0});

  Future<Response> post(
      {required String url,
      Map<String, dynamic>? header,
      dynamic data,
      int retryNumber = 0});
}
