class ErrorModelException implements Exception {
  final String errorMessage;
  int? code;

  ErrorModelException({
    required this.errorMessage,
    this.code,
  });

  factory ErrorModelException.fromJson(Map<String, dynamic> json, {int? code}) {
    return ErrorModelException(
        errorMessage: (code ==500) ? json['message'] : json['error']);
  }
}

class ServerException implements Exception {}

class ConnectionTimeoutException implements Exception {}

class UnauthorizedException implements Exception {}

class InternetException implements Exception {}
