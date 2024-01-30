import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:object/src/utils/print.dart';

extension DateData<T extends Object> on T? {
  DateTime? dateFrom({
    String format = 'yyyy-MM-dd HH:mm:sss',
    String locale = 'en_US',
  }) {
    try {
      DateTime? date;
      if (this == 'null') {
        date = null;
      } else if (this is String) {
        if (isMillis(this as String, format)) {
          date = Timestamp.fromMillisecondsSinceEpoch(
            int.parse(
              this as String,
            ),
          ).toDate();
        } else {
          var df = DateFormat(
            format,
            locale,
          );
          date = df.parse(this as String);
        }
      } else if (this != null && this is Timestamp) {
        date = (this as Timestamp).toDate();
      } else if (this != null && this is DateTime) {
        date = this as DateTime;
      } else if (this != null && (this as dynamic)['_seconds'] != null) {
        date = Timestamp((this as dynamic)['_seconds'],
                (this as dynamic)['_nanoseconds'])
            .toDate();
      }
      return date;
    } catch (e) {
      printDebug('date error: $e');
      return null;
    }
  }

  bool isMillis(String value, String format) {
    try {
      RegExp numeric = RegExp(r'^-?[0-9]+$');
      if (numeric.hasMatch(value)) {
        return true;
      }
      DateFormat(format).parse(value);
    } catch (e) {
      printDebug(e);
    }
    return false;
  }
}
