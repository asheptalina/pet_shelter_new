class RequestResult<T> {
  final bool success;
  final T? body;
  final String? errorMessage;

  RequestResult({required this.success, this.body, this.errorMessage});
}