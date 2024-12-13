import 'dart:async';
import 'dart:io';

import 'package:golrang_task/core/network/base_adapter.dart';
import 'package:golrang_task/core/network/response.dart';
import 'package:http/http.dart' as http;

class HttpAdapter implements BaseAdapter {
  @override
  Future<Response> get(
      {required String url,
      Map<String, dynamic>? header,
      int retryNumber = 0}) async {
    try {
      http.Response res = await http.get(Uri.parse(url));


      return Response(res.statusCode, data: res.body);
    } on TimeoutException {
      return Response.timeout();
    } on SocketException {
      return Response.socket();
    } catch (e) {
      return Response.error();
    }
  }

  @override
  Future<Response> post(
      {required String url,
      Map<String, dynamic>? header,
      data,
      int retryNumber = 0}) {
    // TODO: implement post
    throw UnimplementedError();
  }
}
