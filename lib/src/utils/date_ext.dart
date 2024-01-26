import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:object/src/utils/print.dart';

extension DateData on String {
  DateTime? dateFrom(
    dynamic json, {
    String format = 'yyyy-MM-dd HH:mm:sss',
    String locale = 'en_US',
  }) {
    try {
      DateTime? date;
      if (json[this] == 'null') {
        date = null;
      } else if (json[this] is String) {
        if (isMillis(json[this], format)) {
          date = Timestamp.fromMillisecondsSinceEpoch(
            int.parse(
              json[this],
            ),
          ).toDate();
        } else {
          var df = DateFormat(
            format,
            locale,
          );
          date = df.parse(json[this]);
        }
      } else if (json[this] != null && json[this] is Timestamp) {
        date = (json[this] as Timestamp).toDate();
      } else if (json[this] != null && json[this] is DateTime) {
        date = json[this];
      } else if (json[this] != null && json[this]['_seconds'] != null) {
        date = Timestamp(json[this]['_seconds'], json[this]['_nanoseconds'])
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
