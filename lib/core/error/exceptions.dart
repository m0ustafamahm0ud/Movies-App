import 'package:movie_app/core/network/error_model.dart';

class ServerException implements Exception {
  final ErrorModel errorModel;

  ServerException(this.errorModel);
}

class LocalDataBaseException implements Exception {
  final ErrorModel errorModel;

  LocalDataBaseException(this.errorModel);
}
