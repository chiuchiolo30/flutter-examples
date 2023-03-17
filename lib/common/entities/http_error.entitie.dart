import 'package:dio/dio.dart';

class HttpError {
  HttpError({
    this.error,
    this.stackTrace,
    this.e,
  });

  final DioError? error;
  final StackTrace? stackTrace;
  final Object? e;
}
