import 'package:intl/intl.dart';

String formatDuration(DateTime dateTime) {
  final now = DateTime.now();
  final difference = now.difference(dateTime);
  if (now == dateTime) {
    return 'Just Now';
  } else if (difference.inMinutes < 60) {
    return '${difference.inMinutes} minutes ago';
  } else if (difference.inHours < 24) {
    return '${difference.inHours} hours ago';
  } else if (difference.inDays < 30) {
    return '${difference.inDays} days ago';
  } else if (difference.inDays < 365) {
    final months = difference.inDays ~/ 30;
    return '${months == 1 ? 'one month' : '$months months'} ago';
  } else {
    final years = difference.inDays ~/ 365;
    return '${years == 1 ? 'one year' : '$years years'} ago';
  }
}

String formatDate(DateTime dateTime) {
  final formatter = DateFormat('MMMM d, yyyy');
  return formatter.format(dateTime);
}

String formatDateAndTime(DateTime dateTime) {
  final formatter = DateFormat('d.MM.yyyy h:mm');
  return formatter.format(dateTime);
}

String formatPublishedDate(DateTime dateTime) {
  final formatter = DateFormat('d MMMM yyyy');
  return formatter.format(dateTime);
}

String formatDateOnly(DateTime dateTime) {
  final formatter = DateFormat('d');
  return formatter.format(dateTime);
}
String formatMonthOnly(DateTime dateTime) {
  final formatter = DateFormat('MMMM');
  return formatter.format(dateTime);
}

String formatTime(DateTime dateTime) {
  final formatter = DateFormat('h:mm a');
  return formatter.format(dateTime);
}
