import 'package:flutter/foundation.dart';
import 'request_state.dart';

abstract class BaseModel extends ChangeNotifier {
  RequestState state = RequestState.init;
  String message = '';

  bool _disposed = false;

  void setRequestState(
    RequestState state, {
    String tag = '',
    bool notify = true,
  }) {
    this.state = state;
    print('State: $tag: $state');

    if (notify) {
      notifyListeners();
    }
  }

  void setMessage(String msg) {
    this.message = msg;
  }

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }

  @override
  void notifyListeners() {
    if (!_disposed) {
      super.notifyListeners();
    }
  }
}
