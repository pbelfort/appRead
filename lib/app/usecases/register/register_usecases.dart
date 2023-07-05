import '../../data/model/user_register_model.dart';
import '../../data/repository/register/i_user_register_repository.dart.dart';

abstract class RegisterUsecases {
  static bool checkIsSpecialChar(String passTextController) {
    return passTextController.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
  }

  static bool checkNumeric(String passTextController) {
    return passTextController.contains(RegExp('[0-9]'));
  }

  static bool checkLowerCase(String passTextController) {
    return passTextController.contains(RegExp("(?:[^a-z]*[a-z]){1}"));
  }

  static bool checkUpperCase(String passTextController) {
    return passTextController.contains(RegExp("(?:[^A-Z]*[A-Z]){1}"));
  }

  static bool validExpression(String passTextController) {
    return passTextController
        .contains(RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)"));
  }

  static Future<bool> register(
    UserRegisterModel user,
    IUserRegisterRepository userRegisterRepository,
  ) async {
    return await userRegisterRepository.registerUser(user);
  }
}
