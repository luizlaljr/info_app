import 'package:intl/intl.dart';

class Formatter {
  static String date(String dateNoFormatted) {
    var date = dateNoFormatted.split('-');
    var year = int.parse(date[0]);
    var month = int.parse(date[1]);
    var day = int.parse(date[2]);
    var newDate = new DateTime(year, month, day);
    var formatter = new DateFormat('dd/MM/yyyy');
    String formatted = formatter.format(newDate);
    return formatted;
  }

  static String money(moneyNoFormated) {
    var formatter = new NumberFormat('#,##0.00','pt');
    String formatted = formatter.format(moneyNoFormated);
    return formatted;
  }
}
