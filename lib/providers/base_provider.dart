import 'package:flutter/cupertino.dart';

import '../constants/enmus.dart';

class BaseProvider extends ChangeNotifier {
  bool _isLoading = false;

  String? errorEmail;
  String? errorPassword;
  String? errorQuestion;
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void setErrors(Inputs type, String? errorMsg) {
    switch (type) {
      case Inputs.email:
        errorEmail = errorMsg;
        notifyListeners();
        break;
      case Inputs.password:
        errorPassword = errorMsg;
        notifyListeners();
        break;
      case Inputs.question:
        errorQuestion = errorMsg;
        notifyListeners();
        break;
    }
  }
}
