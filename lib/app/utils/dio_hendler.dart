import 'package:absensi_mahardika/app/utils/log.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioHandler {
  static BuildContext? context;

  static void setContext(BuildContext context) {
    DioHandler.context = context;
  }

  static String parseDioErrorMessage(DioException e) {
    String? error;

    if (e.response?.statusCode == 500) {
      return e.message!;
    }
    Log.http(e.response!, {});
    if (e.type == DioExceptionType.connectionTimeout) {
      return error = "Request Connection Time Out";
    }
    if (e.type == DioExceptionType.sendTimeout) {
      return error = "Request Send Time Out";
    }
    if (e.type == DioExceptionType.receiveTimeout) {
      return error = "Request Receive Time Out";
    }
    if (e.type == DioExceptionType.badResponse) {
      return error = e.response!.data['message'];
    }
    if (e.type == DioExceptionType.cancel) {
      return error = "Request Canceled";
    }
    if (e.type == DioExceptionType.unknown) {
      return error = "SocketException: OS Error: Connection refused";
    }
    return error!;
  }
}
