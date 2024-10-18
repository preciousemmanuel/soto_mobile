import 'dart:io';

import 'package:intl/intl.dart';
import 'package:soto_ecommerce/buyer/core/core.dart';
import 'package:url_launcher/url_launcher.dart';

class AppUtils {
  get count => null;
  static String dateFormatter(String date) {
    var formatter = DateFormat('yyyy-MM-dd');
    DateTime dateTime = formatter.parse(date);
    String formatted = formatter.format(dateTime);
    var reformatDate = formatted.split("-");
    String formattedDate =
        "${reformatDate[2]} + '-' + ${reformatDate[1]} + '-' + ${reformatDate[0]}";

    //print(formattedDate);
    return formattedDate;
  }

  static String dateFormatter2(DateTime date) {
    var formatter = DateFormat('dd MMM yyyy');

    String formatted = formatter.format(date);

    //print(formattedDate);
    return formatted;
  }

  //e.g 23rd March, 2021
  static String dayWithSuffixMonthAndYear(DateTime date) {
    var suffix = "th";
    //var suffix = "";
    var digit = date.day % 10;
    if ((digit > 0 && digit < 4) && (date.day < 11 || date.day > 13)) {
      suffix = ["st", "nd", "rd"][digit - 1];
    }
    return DateFormat("d'$suffix' MMM, y").format(date);
  }

  //e.g 23rd March, 2021 4:40PM
  static String d(DateTime date) {
    var suffix = "th";
    var digit = date.day % 10;
    if ((digit > 0 && digit < 4) && (date.day < 11 || date.day > 13)) {
      suffix = ["st", "nd", "rd"][digit - 1];
    }
    String dd = DateFormat("d'$suffix' MMM, y").format(date);
    String tt = DateFormat.jm().format(date);

    return "$dd $tt";
  }

  static String yearMonthDay(String date) {
    var reformatDate = date.split("-");
    String formattedDate =
        "${reformatDate[2]} +  '-' + ${reformatDate[1]} + '-' + ${reformatDate[0]}";
    return formattedDate;
  }

  ///convert datetime format to Month, Day, Year and time
  static String monthDayYearAndTime(DateTime date) {
    return "${DateFormat.yMMMd().format(date)} ${DateFormat.jm().format(date)}";
  }

  ///convert datetime format to day and abbrev.month
  static String dayAndAbbrevMonth(DateTime date) {
    return "${DateFormat.d().format(date)} ${DateFormat.MMM().format(date)}";
  }

  static String time(DateTime date) {
    return DateFormat.jm().format(date);
  }

  static String formatTime(DateTime dateTime) {
    return DateFormat('HH:mm').format(dateTime);
  }

  static String hourTime(DateTime date) {
    return DateFormat.jm().format(date).split(" ")[0];
  }

  static String hourTimePeriod(DateTime date) {
    return DateFormat.jm().format(date).split(" ")[1];
  }

  static String formatHoursMinutes(DateTime time) {
    // Parse the given dateTime string to a DateTime object
    // DateTime dateTime = DateTime.parse(time);

    // Format the DateTime object to "12hrs 38 mins"
    String formattedDateTime = DateFormat('HHmm').format(time);

    // Convert the formatted string to the desired format
    int hours = int.parse(formattedDateTime.substring(0, 2));
    int minutes = int.parse(formattedDateTime.substring(2, 4));

    return '${hours}hrs $minutes mins';
  }

  static String expireAtFormatDuration(Duration duration) {
    if (duration.inMinutes <= 0) {
      return "Expired";
    }

    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitHours = twoDigits(duration.inHours.remainder(60));
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));

    return "Expires in $twoDigitHours:$twoDigitMinutes:$twoDigitSeconds";
  }

  static String formatDateTime(String dateTimeString) {
    // Parse the input date string
    DateTime dateTime = DateTime.parse(dateTimeString);

    // Format the date and time
    String formattedDate = DateFormat.yMMMd().format(dateTime);
    String formattedTime = DateFormat.Hm().format(dateTime);

    // Construct the final formatted string
    return '$formattedDate | $formattedTime';
  }

  ///formats large figures(eg 5000 -> 5k
  static String formatFigure({required double largeFigure}) {
    return NumberFormat.compact().format(largeFigure);
  }

  ///format currency
  static String formatAmount({required double amount}) {
    //a final oCcy = NumberFormat("#,##0", "en_US");
    NumberFormat oCcy = NumberFormat.decimalPattern('en_us');
    String formattedAmount = oCcy.format(amount);
    return formattedAmount;
  }

  /// takes a string
  static String formatAmountString(String amount) {
    return formatAmount(amount: double.tryParse(amount) ?? 0.0);
  }

  /// takes a string
  static String formatAmountDoubleString(String amount) {
    return formatAmountWithDecimal(amount: double.tryParse(amount) ?? 0.0);
  }

  static String formatAmountWithDecimal({required double amount}) {
    final oCcy = NumberFormat("#,##0.00", "en_US");
    String formattedAmount = oCcy.format(amount);
    return formattedAmount;
  }

  // ///format currency
  // static String formatAmount({required double amount}) {
  //   final oCcy = NumberFormat("#,##0.00", "en_US");
  //   String formattedAmount = oCcy.format(amount);
  //   return formattedAmount;
  // }

  static String formatNumbers({required double amount}) {
    final oCcy = NumberFormat("#,##0", "en_US");
    String formattedAmount = oCcy.format(amount);
    return formattedAmount;
  }

  ///convert datetime format to Month and Year
  static String monthAndYear({required DateTime date}) {
    return DateFormat.yMMM().format(date);
  }

  ///convert datetime format to Month, Day and Year
  static String dateAndTime({required DateTime date}) {
    return DateFormat.yMMMd().format(date);
  }

  ///convert datetime format to Day/Month/Year
  static String dayMonthYear({required DateTime date}) {
    return "${DateFormat.d().format(date)}/${DateFormat.M().format(date)}/${DateFormat.y().format(date)}";
  }

  ///convert datetime format to Day/Month/Year
  static String dayMonthYearDashSeperated({required DateTime date}) {
    return "${DateFormat.d().format(date)}-${DateFormat.M().format(date)}-${DateFormat.y().format(date)}";
  }

  static String fDateTime({required DateTime date, String seperator = " "}) {
    return dayWithSuffixMonthAndYear(date) + seperator + time(date);
  }

  static String formatPhoneNo(String phoneNo) {
    String formatted = phoneNo.trim();
    formatted = formatted.replaceAll(RegExp(r'-'), "");
    formatted = formatted.replaceAll(RegExp(r' '), "");
    return formatted;
  }

  ///returns the number of days left on user's subscription plan
  static String daysLeft(
      {required DateTime expiryDate, required DateTime paymentDate}) {
    final difference = expiryDate.difference(paymentDate).inDays;
    return difference.toString();
  }

  static String timeAgo(DateTime date, {bool numericDates = true}) {
    final DateTime date2 = DateTime.now();
    final Duration difference = date2.difference(date);

    if ((difference.inDays / 365).floor() >= 2) {
      return '${(difference.inDays / 365).floor()} years ago';
    } else if ((difference.inDays / 365).floor() >= 1) {
      return numericDates ? '1 year ago' : 'Last year';
    } else if ((difference.inDays / 30).floor() >= 2) {
      return '${(difference.inDays / 365).floor()} months ago';
    } else if ((difference.inDays / 30).floor() >= 1) {
      return numericDates ? '1 month ago' : 'Last month';
    } else if ((difference.inDays / 7).floor() >= 2) {
      return '${(difference.inDays / 7).floor()} weeks ago';
    } else if ((difference.inDays / 7).floor() >= 1) {
      return numericDates ? '1 week ago' : 'Last week';
    } else if (difference.inDays >= 2) {
      return '${difference.inDays} days ago';
    } else if (difference.inDays >= 1) {
      return numericDates ? '1 day ago' : 'Yesterday';
    } else if (difference.inHours >= 2) {
      return '${difference.inHours} hours ago';
    } else if (difference.inHours >= 1) {
      return numericDates ? '1 hour ago' : 'An hour ago';
    } else if (difference.inMinutes >= 2) {
      return '${difference.inMinutes} minutes ago';
    } else if (difference.inMinutes >= 1) {
      return numericDates ? '1 minute ago' : 'A minute ago';
    } else if (difference.inSeconds >= 3) {
      return '${difference.inSeconds} seconds ago';
    } else {
      return 'Just now';
    }
  }

  static String getInitials(String firstName, String lastName) {
    String initials = "";
    if (firstName.isNotEmpty) {
      initials += firstName.substring(0, 1);
    }
    if (lastName.isNotEmpty) {
      initials += lastName.substring(0, 1);
    }

    return initials.toUpperCase();
  }

  static String getInitialsFromFullname(String fullname) {
    String initials = "";
    String firstName;
    String lastName;

    List<String> names = fullname.split(" ");
    if (names.isNotEmpty) {
      firstName = names[0];
      initials += firstName.substring(0, 1);
    }
    if (names.length > 1) {
      lastName = names[1];
      initials += lastName.substring(0, 1);
    }

    return initials.toUpperCase();
  }

  static String getErrorMessage({required String message}) {
    String returningMessage;
    if (message == "Connection failed" ||
        message.toString().contains("Failed host lookup")) {
      returningMessage =
          "Error establishing internet connection. Please try again";
    } else if (message.toString().contains("Future not completed")) {
      returningMessage =
          "Slow internet connection. Please check your internet connection and try again";
    } else if (message == "Internal Server Error") {
      returningMessage = "An error occurred. Please try again";
    } else {
      returningMessage = message;
    }

    return returningMessage;
  }

  static String getDisplayImage(String img) {
    List<String> images = img.split("|");
    return images.first;
  }

  static String getFirstName(String name) {
    if (name.isEmpty) {
      return "";
    }
    return capitalizeText(name.split(" ").first);
  }

  static String capitalizeText(String text, {String? seperator}) {
    seperator = seperator ?? "''";
    String res = "";
    List<String> words = text.split(seperator);
    for (String w in words) {
      res += " ${w.substring(0, 1).toUpperCase()}${w.substring(1)}";
    }
    return res.trim();
  }

  //get the shortest Side of the target device
  double shortestSide(BuildContext context) {
    return MediaQuery.of(context).size.shortestSide;
  }

//check the type of target device
  bool isMobileLayout(BuildContext context) {
    return shortestSide(context) < 600;
  }

  static String addRemoveDelimeter(String amount,
      {required bool addDelimter, bool addDecimal = false}) {
    String formattedString = amount;
    if (formattedString.isNotEmpty && formattedString.contains(",")) {
      formattedString = formattedString.replaceAll(RegExp(r','), "");
    }

    if (addDelimter) {
      // formattedString = "" +
      //     AppUtils.formatAmount(amount: double.tryParse(formattedString) ?? 0);

      if (addDecimal) {
        formattedString = AppUtils.formatAmountWithDecimal(
            amount: double.tryParse(formattedString) ?? 0.00);
      } else {
        formattedString = AppUtils.formatAmount(
            amount: double.tryParse(formattedString) ?? 0.00);
      }

      return formattedString;
    } else {
      if (formattedString.isNotEmpty && formattedString.contains(",")) {
        formattedString = formattedString.replaceAll(RegExp(r','), "");
      }
    }
    return formattedString;
  }

  static double getTwoDecimalPlace({required double number}) {
    try {
      String figure = number.toString();
      final b = figure.split(".");
      final whole = b[0];
      final fractional = b[1];
      final frac = fractional.split("");
      String f = "";
      for (int i = 0; i < 2; i++) {
        f += frac[i];
      }

      return double.tryParse("$whole.$f") ?? 0.0;
    } catch (e) {
      return double.tryParse(number.toStringAsFixed(2)) ?? 0.0;
    }
  }

  static String currency() {
    // Locale locale = Localizations.localeOf(navigatorKey.currentContext!);
    var format =
        NumberFormat.simpleCurrency(locale: Platform.localeName, name: 'NGN');
    printty("CURRENCY SYMBOL ${format.currencySymbol}"); // $
    printty("CURRENCY NAME ${format.currencyName}");
    return format.currencySymbol;
  }

  static String? formatNGNNumber(String phoneNumber) {
    if (phoneNumber.length < 10) {
      return null;
    }
    if (phoneNumber.startsWith("0") && phoneNumber.length < 11) {
      return null;
    }

    String number = phoneNumber.contains("234")
        ? phoneNumber.split("234").last
        : phoneNumber;

    return number.startsWith("0") ? "234${number.substring(1)}" : "234$number";
  }

  static bool isToday(DateTime d) {
    final now = DateTime.now();
    return now.year == d.year && now.month == d.month && now.day == d.day;
  }

  static bool isYesterday(DateTime d) {
    final now = DateTime.now().subtract(const Duration(days: 1));
    return now.year == d.year && now.month == d.month && now.day == d.day;
  }

  static bool isOlder(DateTime d) {
    return DateTime.now().difference(d).inHours > 48;

    // final now = DateTime.now().subtract(const Duration(days: 2));
    // return now.year == d.year && now.month == d.month && now.day >= d.day;
  }

  static launchURL({required String url, LaunchMode? launchMode}) async {
    try {
      if (await canLaunchUrl(Uri.parse(url))) {
        return await launchUrl(Uri.parse(url),
            mode: launchMode ?? LaunchMode.inAppWebView);
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  static launchEmail({required String url}) async {
    final Uri emailLaunchUri = Uri(scheme: 'mailto', path: url);

    await launchUrl(emailLaunchUri);
  }

  static openPhoneDialler({required String url}) async {
    final Uri emailLaunchUri = Uri(scheme: 'tel', path: url);

    await launchUrl(emailLaunchUri);
  }
}
