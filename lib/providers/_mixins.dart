import 'package:the_todo_app/providers/base_provider.dart';

mixin MixinProgressProvider on BaseProvider {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }
}
