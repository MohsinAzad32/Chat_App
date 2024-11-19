class AppException implements Exception {
  final message;
  final prefix;

  AppException([this.message, this.prefix]);

  @override
  String toString() {
    return '$prefix$message';
  }
}

class FetchDataException extends AppException {
  FetchDataException({String? message})
      : super(message, 'Error During Communication');
}

class BadRequestException extends AppException {
  BadRequestException({String? message}) : super(message, 'Invalid Request');
}

class UnAuthorizedException extends AppException {
  UnAuthorizedException({String? message})
      : super(message, 'UnAuthorized Request');
}

class InValidInputException extends AppException {
  InValidInputException({String? message}) : super(message, 'Invalid Input');
}
