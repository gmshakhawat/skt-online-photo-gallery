import 'package:skt_photo_gallery/src/widgets/skt_alert_dialog.dart';

class CustomException implements Exception {
  final _message;
  final _prefix;

  CustomException([this._message, this._prefix]);

  String toString() {
    sktAlertDialog("$_message");
    return "$_prefix$_message";
  }
}

class FetchDataException extends CustomException {
  FetchDataException([String? message])
      : super(message, "Error During Communication: ");
}

class BadRequestException extends CustomException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

class UnauthorisedException extends CustomException {
  UnauthorisedException([message]) : super(message, "Unauthorized: ");
}

class ForbiddenException extends CustomException {
  ForbiddenException([String? message]) : super(message, "Forbidded: ");
}

class NotFoundException extends CustomException {
  NotFoundException([String? message]) : super(message, "Not Found: ");
}

class OtherException extends CustomException {
  OtherException([String? message]) : super(message, "Exception: ");
}
