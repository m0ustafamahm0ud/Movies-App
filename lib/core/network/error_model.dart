import 'package:equatable/equatable.dart';

class ErrorModel extends Equatable {
  final int code;
  final String message;
  final bool sucess;

  const ErrorModel({
    required this.code,
    required this.message,
    required this.sucess,
  });

  @override
  List<Object?> get props => [code, message, sucess];

  factory ErrorModel.fromJson(Map<String, dynamic> json) => ErrorModel(
        code: json['status_code'],
        message: json['status_message'],
        sucess: json['success'],
      );
}
