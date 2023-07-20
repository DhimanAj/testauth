import 'package:intl/intl.dart';

class DateFun {
  static String formatedDateTime(dateString) {

/*    DateTime parseDate =
        DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(dateString);*/
    var inputDate = DateTime.parse(dateString);
    print("inputData:-- $inputDate");
    var outputFormat = DateFormat('d MMM y,').add_jm();
    var outputDate = outputFormat.format(inputDate);
    return outputDate;

  }

  static String formatedDateWithDay(dateString) {
    return DateFormat('EEE, dd MMM, yyyy  HH:mm a')
        .format(DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z").parse(dateString));
  }

  static String formatedDateWithDayNoYear(dateString) {
    return DateFormat('EEE, dd MMM')
        .add_jm()
        .format(DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z").parse(dateString));
  }

  static String formatedDateTimeForAllRequest(dateString) {
    DateTime parseDate =
        DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(dateString);
    var inputDate = DateTime.parse(parseDate.toString());
    var outputFormat = DateFormat('d MMM y');
    var outputDate = outputFormat.add_jm().format(inputDate);
    return outputDate;
  }

  static String formatedDateWithDateNoTime(dateString) {
    return DateFormat('EEE, dd MMM, yyyy')
        .format(DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z").parse(dateString));
  }

  static String formatedDateOnlyTime(dateString) {
    return DateFormat.jm()
        .format(DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z").parse(dateString));
  }
}
