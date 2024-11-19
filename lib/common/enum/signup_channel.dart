enum SignupChannel {
  normal,
  google,
  facebook,
  apple,
}

extension SignupChannelExtension on SignupChannel {
  String get name {
    switch (this) {
      case SignupChannel.normal:
        return 'DEFAULT';
      case SignupChannel.google:
        return 'GOOGLE';
      case SignupChannel.facebook:
        return 'FACEBOOK';
      case SignupChannel.apple:
        return 'APPLE';
    }
  }
}
