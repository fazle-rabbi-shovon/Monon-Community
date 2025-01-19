abstract class BasePresenter<V, R> {
  final R _repository;
  final V _view;

  BasePresenter(this._view, this._repository);

  V getView() {
    return _view;
  }

  R getRepository() {
    return _repository;
  }
}
