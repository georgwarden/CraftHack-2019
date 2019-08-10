import 'package:crafthack_app/utils/Emitter.dart';

class Lazy<T> {
  T _value;
  Emitter<T> init;

  Lazy(this.init);

  T get() {
    if (_value == null) {
      _value = init();
      return _value;
    } else {
      return _value;
    }
  }
}
