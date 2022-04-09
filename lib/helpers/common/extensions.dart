/* ************************************************************************
* Directory Name: common                                                  *
* File Name: extensions.dart                                              *
* Created At: Saturday, 9th April 2022 8:48:59 am                         *
* Created By: singsys (Harshit Kishor)                                    *
************************************************************************ */
extension BoolParsing on String {
  bool parseBool() {
    return toLowerCase() == 'true';
  }
}

extension StringExtension on String {
  String capitalize() {
    return isEmpty
        ? ''
        : "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

  String replaceSymbol() {
    return isEmpty ? '' : replaceAll(RegExp(r'(?:_|[^\w\s])+'), ' ');
  }

  String firstLetter() {
    List arr = split(' ');
    String fl = "${arr[0][0]}${arr[arr.length - 1][0]}".toUpperCase();
    return isEmpty ? '' : fl;
  }
}
