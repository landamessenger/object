import 'package:intl/intl.dart';

import 'print.dart';

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
