import 'package:intl/intl.dart';

String htmlToString(String htmlBody) => Bidi.stripHtmlIfNeeded(htmlBody);
