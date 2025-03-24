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
    return '${firstName[0].toUpperCase()}${lastName[0].toUpperCase()}';
  }

  final names = <String>[firstName, lastName]
      .where((element) => element.isNotEmpty)
      .toList();
  if (names.length == 1) {
    final name = names.first;
    return '${name[0].toUpperCase()}${name.length > 1 ? name[1].toUpperCase() : ''}';
  }

  return 'GU';
}
