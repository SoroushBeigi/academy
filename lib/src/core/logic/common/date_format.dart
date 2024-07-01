import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DateFormat{
  static String timeAgo(DateTime date,AppLocalizations localization){
    final Duration diff = DateTime.now().difference(date);
    if (diff.inDays >= 365) {
      int years = diff.inDays ~/ 365;
      return '$years ${years>1? localization.yearsAgo : localization.yearAgo}';

    } else if (diff.inDays >= 30) {
      int months = diff.inDays ~/ 30;
      return '$months ${months>1? localization.monthsAgo : localization.monthAgo}';
    } else if (diff.inDays >= 1) {
      int days = diff.inDays;
      return '$days ${days>1? localization.daysAgo : localization.dayAgo}';
    } else if (diff.inHours >= 1) {
      int hours = diff.inHours;
      return '$hours ${hours>1? localization.hoursAgo : localization.hourAgo}';
    } else if (diff.inMinutes >= 1) {
      int minutes = diff.inMinutes;
      return '$minutes ${minutes>1? localization.minutesAgo : localization.minuteAgo}';
    } else {
      int seconds = diff.inSeconds;
      return '$seconds ${seconds>1? localization.secondsAgo : localization.secondAgo}';
    }
  }
}