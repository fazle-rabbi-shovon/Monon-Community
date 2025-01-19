abstract class BaseView<P, R> {
  P? _presenter;
  R? _repository;

  P initPresenter();
  R initRepository();

  P getPresenter() {
    if (_presenter == null) {
      _presenter = initPresenter();
    }
    return _presenter!;
  }

  R getRepository() {
    if (_repository == null) {
      _repository = initRepository();
    }
    return _repository!;
  }

  void showProgress(bool show);
  void showErrorMsg(String msg);
}
