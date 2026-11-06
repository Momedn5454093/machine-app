abstract class LoginState<T> {
  const LoginState();

  const factory LoginState.initial() = Initial;
  const factory LoginState.loading() = Loading;
  const factory LoginState.success(T data) = Success<T>;
  const factory LoginState.error(String error) = Error;
}

class Initial<T> extends LoginState<T> {
  const Initial();
}

class Loading<T> extends LoginState<T> {
  const Loading();
}

class Success<T> extends LoginState<T> {
  final T data;
  const Success(this.data);
}

class Error<T> extends LoginState<T> {
  final String error;
  const Error(this.error);
}
