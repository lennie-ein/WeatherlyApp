import 'package:intl/intl.dart';
import 'package:weatherforecast/Util/config.dart';

class Util {

  var appId = Config.appId;

  static String getFormattedDate(DateTime dateTime) {

    return new DateFormat("EEEE, MMM d, y").format(dateTime);

  }


}