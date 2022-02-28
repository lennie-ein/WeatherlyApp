import 'package:intl/intl.dart';

class Util {

  static String appId = "7121fb1e03d1d43f68c0efc566a96507";

  static String getFormattedDate(DateTime dateTime) {

    return new DateFormat("EEEE, MMM d, y").format(dateTime);

  }


}