class Response {
  Response(this.statusCode, {this.message, this.data});

  factory Response.error() => Response(0);

  factory Response.timeout() => Response(1, message: "Timeout Exception!");

  factory Response.socket() => Response(2, message: "Socket Exception!");

  /// Contains all http status
  /// also some internal status
  /// 0 = unknown
  /// 1 = timeout exception
  /// 2 = socket exception
  final int statusCode;
  final String? message;
  final String? data;

  bool get isSucceed => statusCode >= 200 && statusCode < 300;
}
