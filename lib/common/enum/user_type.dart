enum UserType { user, vendor }

extension UserTypeExtension on UserType {
  String get name {
    switch (this) {
      case UserType.user:
        return 'USER';
      case UserType.vendor:
        return 'VENDOR';
    }
  }
}
