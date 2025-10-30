// lib/core/utils/format.dart
import 'package:intl/intl.dart';

class Fmt {
  static final _kcal = NumberFormat.decimalPattern();
  static final _int = NumberFormat.decimalPattern();
  static final _date = DateFormat('yyyy-MM-dd');

  static String kcal(int v) => '${_kcal.format(v)} kcal';
  static String intNum(int v) => _int.format(v);
  static String dateIso(DateTime d) => _date.format(d);
}
