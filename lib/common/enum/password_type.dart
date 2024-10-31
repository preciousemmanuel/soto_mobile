enum PasswordType {
  changePassword,
  forgotPassword,
  signupComplete,
  passwordReset,
  accountValidation,
}

extension PasswordTypExtension on PasswordType {
  String get name {
    switch (this) {
      case PasswordType.changePassword:
        return 'CHANGE_PASSWORD';
      case PasswordType.forgotPassword:
        return 'FORGOT_PASSWORD';
      case PasswordType.signupComplete:
        return 'SIGNUP_COMPLETE';
      case PasswordType.passwordReset:
        return 'PASSWORD_RESET';
      case PasswordType.accountValidation:
        return 'ACCOUNT_VALIDATION';
    }
  }
}
