import 'package:golrang_task/core/network/base_adapter.dart';
import 'package:golrang_task/core/network/response.dart';

class RestService extends BaseAdapter {
  RestService(this._baseAdapter);

  final BaseAdapter _baseAdapter;

  @override
  Future<Response> get(
          {required String url,
          Map<String, dynamic>? header,
          int retryNumber = 0}) async =>
      await _baseAdapter.get(url: url, header: header, retryNumber: retryNumber);

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
