extension StringExtension on String {
  String capitalize() {
    if (isEmpty) return this;
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

  String capitalizeFirstLetter() {
    if (isEmpty) return this;
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}

extension StringExt on String {
  String replaceAllCommas() {
    return replaceAll(',', '');
  }
}

String getFullNamesInitails(String firstName, String lastName) {
  if (firstName.isNotEmpty && lastName.isNotEmpty) {
    return '${firstName[0]}${lastName[0]}';
  } else if (firstName.isNotEmpty) {
    // check if firstName has more than 1 word
    if (firstName.split(' ').length > 1) {
      return '${firstName.split(' ')[0][0]}${firstName.split(' ')[1][0]}';
    }
    return '${firstName[0]}${firstName.length > 1 ? firstName[1] : ''}';
  } else if (lastName.isNotEmpty) {
    return '${lastName[0]}${lastName.length > 1 ? lastName[1] : ''}';
  } else {
    return 'GU';
  }
}
