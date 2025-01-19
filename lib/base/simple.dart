class Simple<T> extends Subscribe<T> {
  bool _success = false;
  late T _data;
  String _msg = '';

  late void Function(T data) _onSuccess;
  late void Function(String msg) _onError;

  T getData() {
    return _data;
  }

  Simple<T> from(T data) {
    this._success = true;
    this._data = data;
    return this;
  }

  Simple<T> error(String msg) {
    this._success = false;
    this._msg = msg;
    return this;
  }

  Simple<T> subscribe({
    required Function(T data) onSuccess,
    required Function(String msg) onError,
  }) {
    this._onSuccess = onSuccess;
    this._onError = onError;
    return this;
  }

  Simple<T> map() {
    if (_success) {
      onSuccess(_data!);
    } else {
      onError(_msg);
    }
    return this;
  }

  @override
  void onSuccess(T data) {
    _onSuccess(data);
  }

  @override
  void onError(String msg) {
    _onError(msg);
  }
}

abstract class Subscribe<T> {
  void onSuccess(T data);
  void onError(String msg);
}

abstract class SubscribePost<T> {
  void onSuccessPost(T data);
  void onErrorPost(String msg);
}
