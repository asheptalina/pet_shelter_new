enum RequestStatus {
  success, failure, tokenExpired
}

class RequestResult<T> {
  final RequestStatus status;
  final T? body;
  final String? errorMessage;

  RequestResult({required this.status, this.body, this.errorMessage});
}