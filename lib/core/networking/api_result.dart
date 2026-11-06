import 'api_error_handler.dart';

abstract class ApiResult<T> {
  const ApiResult();

  const factory ApiResult.success(T data) = Success<T>;
  const factory ApiResult.failure(ErrorHandler errorHandler) = Failure<T>;

  R when<R>({
    required R Function(T data) success,
    required R Function(ErrorHandler errorHandler) failure,
  }) {
    final t = this;
    if (t is Success<T>) {
      return success(t.data);
    } else if (t is Failure<T>) {
      return failure(t.errorHandler);
    }
    throw Exception('Invalid ApiResult state');
  }
}

class Success<T> extends ApiResult<T> {
  final T data;
  const Success(this.data);
}

class Failure<T> extends ApiResult<T> {
  final ErrorHandler errorHandler;
  const Failure(this.errorHandler);
}
