class CommonException implements Exception {
  final String message;

  CommonException(this.message);

  @override
  String toString() => message;
}

class BadRequestException extends CommonException {
  BadRequestException(super.message);
}

class UnauthorizedException extends CommonException {
  UnauthorizedException(super.message);
}

class ForbiddenException extends CommonException {
  ForbiddenException(super.message);
}

class NotFoundException extends CommonException {
  NotFoundException(super.message);
}

class InternalServerException extends CommonException {
  InternalServerException(super.message);
}

class NetworkException extends CommonException {
  NetworkException(super.message);
}

class UnknownException extends CommonException {
  UnknownException(super.message);
}
