enum GenderType { male, female, ratherNotSay, none }

extension GenderTypeExtension on GenderType {
  String get value {
    switch (this) {
      case GenderType.male:
        return 'Male';
      case GenderType.female:
        return 'Female';
      case GenderType.ratherNotSay:
        return 'Rather not say';
      default:
        return 'None';
    }
  }
}
