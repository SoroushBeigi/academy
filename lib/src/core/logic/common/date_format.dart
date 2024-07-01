import 'package:academy/src/core/locale_provdier.dart';
import 'package:academy/src/di/di_setup.dart';

class DateFormat{
  static String timeAgo(DateTime date){
    final Duration diff = DateTime.now().difference(date);
    final isFa = getIt<LocaleProvider>().isFa;
    if (diff.inDays >= 365) {
      int years = diff.inDays ~/ 365;
      if(isFa) {
        return "$years سال پیش";
      } else {
        return "$years year${years > 1 ? 's' : ''} ago";
      }
    } else if (diff.inDays >= 30) {
      int months = diff.inDays ~/ 30;
      if(isFa) {
        return "$months ماه پیش";
      } else {
        return "$months month${months > 1 ? 's' : ''} ago";
      }
    } else if (diff.inDays >= 1) {
      int days = diff.inDays;
      if(isFa) {
        return "$days روز پیش";
      } else {
        return "$days day${days > 1 ? 's' : ''} ago";
      }
    } else if (diff.inHours >= 1) {
      int hours = diff.inHours;
      if(isFa) {
        return "$hours ساعت پیش";
      } else {
        return "$hours hour${hours > 1 ? 's' : ''} ago";
      }
    } else if (diff.inMinutes >= 1) {
      int minutes = diff.inMinutes;
      if(isFa) {
        return "$minutes دقیقه پیش";
      } else {
        return "$minutes minute${minutes > 1 ? 's' : ''} ago";
      }
    } else {
      int seconds = diff.inSeconds;
      if(isFa) {
        return "$seconds ثانیه پیش";
      } else {
        return "$seconds second${seconds > 1 ? 's' : ''} ago";
      }
    }
  }
}