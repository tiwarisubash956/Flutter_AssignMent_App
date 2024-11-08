// ignore: file_names, camel_case_types
abstract class failure {}

class ServerFailure extends failure {
  final String message;

  ServerFailure({required this.message});
}
