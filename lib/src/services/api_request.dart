import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:skt_photo_gallery/app_config.dart';
import 'package:skt_photo_gallery/main.dart';
import 'package:skt_photo_gallery/src/constents/skt_strings.dart';
import 'package:skt_photo_gallery/src/services/api_exception.dart';
import 'package:skt_photo_gallery/src/utils/testing.dart';
import 'package:skt_photo_gallery/src/widgets/skt_alert_dialog.dart';

const TIME_OUT = 60;

class APIRequest {
  final http.Client client;

  APIRequest({required this.client});
//   GET call
  @override
  Future<dynamic> get({required endPoint}) async {
    sktPrint(endPoint);

    http.Response response;
    try {
      //Try..
      var uri = Uri.parse(
          AppConfig.of(navigatorKey.currentContext!).baseUrl + endPoint);
      sktPrint("______________________url:" + uri.toString());
      response = await client
          .get(uri)
          .timeout(const Duration(seconds: TIME_OUT), onTimeout: () {
        sktPrint(SktStrings.timeOut);
        sktAlertDialog(SktStrings.timeOut);
        throw TimeoutException(SktStrings.timeOutRequestMessage);
      });
    } on SocketException {
      throw FetchDataException(SktStrings.connectionIssueRequestMessage);
    }

    return _response(response);
  }

  static dynamic _response(var response) async {
    sktPrint("Req-Code-> ${response.statusCode}");

    switch (response.statusCode) {
      case 200:
        var responseJson = utf8.decode(response.bodyBytes);
        sktPrint("Res: " + responseJson);
        return responseJson;
      case 400:
        throw BadRequestException(SktStrings.badRequestMessage);
      case 401:
        throw UnauthorisedException(SktStrings.unauthorisedRequestMessage);
      case 403:
        throw ForbiddenException(SktStrings.forbiddedRequestMessage);
      case 404:
        throw NotFoundException(SktStrings.notFoundRequestMessage);
      case 500:
      case 503:
        throw OtherException(SktStrings.somethingWentRequestMessage);

      default:
        var responseJson = utf8.decode(response.bodyBytes);

        return responseJson;
    }
  }
}
