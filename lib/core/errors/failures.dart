import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  const Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('connection timeout with ApiServer');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with ApiServer');

      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with ApiServer');

      case DioExceptionType.badCertificate:
        return ServerFailure('badCertificate');

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(dioError.response!.statusCode!, dioError.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure(' Request with ApiServer was canceled');

      case DioExceptionType.connectionError:
        return ServerFailure('connection error');

      case DioExceptionType.unknown:
        if (dioError.message!.contains('SocketException')) {
          return ServerFailure('No Internet Connection');
        }
        return ServerFailure('Unexpected error');
      default :  
      return ServerFailure('oops there was an error , try again');

    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('your request not found ,please try later!');
    } else if (statusCode == 500) {
      return ServerFailure('Internal server error , please tyr later!');
    } else {
      return ServerFailure('oops there was an error , try again');
    }
  }
}
