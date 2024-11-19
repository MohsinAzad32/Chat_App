import 'package:mvvm/data/response/status.dart';

class ApiResponse<T> {
  String? message;
  T? data;
  Status? status;

  ApiResponse.loading() : status = Status.loading;

  ApiResponse.completed() : status = Status.completed;

  ApiResponse.error() : status = Status.error;

  @override
  String toString() {
    return 'Status $status \n Message:$message \n Data:$data';
  }
}
