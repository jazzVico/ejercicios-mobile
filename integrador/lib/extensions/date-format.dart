import 'package:date_format/date_format.dart';

String dateFormat(DateTime date){
  return formatDate(date,[dd,'/',mm,'/',yyyy]);
}