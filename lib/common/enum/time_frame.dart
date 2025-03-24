enum TimeFrame {
  yesterday,
  today,
  thisWeek,
  last7Days,
  lastWeek,
  thisMonth,
  last6Months,
  last12Months,
}

extension TimeFrameExtension on TimeFrame {
  String get text {
    switch (this) {
      case TimeFrame.yesterday:
        return 'YESTERDAY';
      case TimeFrame.today:
        return 'TODAY';
      case TimeFrame.thisWeek:
        return 'THIS_WEEK';
      case TimeFrame.last7Days:
        return 'LAST_7_DAYS';
      case TimeFrame.lastWeek:
        return 'LAST_WEEK';
      case TimeFrame.thisMonth:
        return 'THIS_MONTH';
      case TimeFrame.last6Months:
        return 'LAST_6_MONTHS';
      case TimeFrame.last12Months:
        return 'LAST_12_MONTHS';
    }
  }
}
