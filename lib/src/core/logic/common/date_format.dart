class DateFormat{
  static String timeAgo(DateTime date){
    final Duration diff = DateTime.now().difference(date);

    if (diff.inDays >= 365) {
      int years = diff.inDays ~/ 365;
      return "$years year${years > 1 ? 's' : ''} ago";
    } else if (diff.inDays >= 30) {
      int months = diff.inDays ~/ 30;
      return "$months month${months > 1 ? 's' : ''} ago";
    } else if (diff.inDays >= 1) {
      int days = diff.inDays;
      return "$days day${days > 1 ? 's' : ''} ago";
    } else if (diff.inHours >= 1) {
      int hours = diff.inHours;
      return "$hours hour${hours > 1 ? 's' : ''} ago";
    } else if (diff.inMinutes >= 1) {
      int minutes = diff.inMinutes;
      return "$minutes minute${minutes > 1 ? 's' : ''} ago";
    } else {
      int seconds = diff.inSeconds;
      return "$seconds second${seconds > 1 ? 's' : ''} ago";
    }
  }
}