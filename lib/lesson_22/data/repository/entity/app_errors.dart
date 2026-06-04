class CustomServerError implements Exception {
  CustomServerError(this.message);
  final String message;

  @override
  String toString() => 'CustomServerError: $message';
}
