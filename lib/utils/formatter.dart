class Formatter {
  Formatter._();

  static final Map<int, String> _months = {
    1: "Janeiro",
    2: "Fevereiro",
    3: "Março",
    4: "Abril",
    5: "Maio",
    6: "Junho",
    7: "Julho",
    8: "Agosto",
    9: "Setembro",
    10: "Outubro",
    11: "Novembro",
    12: "Dezembro"
  };

  static final Map<int, String> _weekdayByNumber = {
    1: "Segunda",
    2: "Terça",
    3: "Quarta",
    4: "Quinta",
    5: "Sexta",
    6: "Sábado",
    7: "Domingo"
  };

  static final Map<String, String> _weekdayByAbbreviation = {
    "Seg": "Segunda",
    "Ter": "Terça",
    "Qua": "Quarta",
    "Qui": "Quinta",
    "Sex": "Sexta",
    "Sáb": "Sábado",
    "Dom": "Domingo"
  };

  static String numberDateToWrittenDate(String numberDate) {
    final splitDate = numberDate.toString().split("/");
    final day = splitDate[0], monthNumber = int.parse(splitDate[1]);

    return "$day de ${_months[monthNumber]}";
  }

  static String getWeekdayWithDayCode(int dayCode) {
    return _weekdayByNumber[dayCode]!;
  }

  static String getWeekdayWithAbbreviation(String weekdayAbbreviation) {
    return _weekdayByAbbreviation[weekdayAbbreviation]!;
  }

  static String getWeekdayWithDate(String date) {
    final year = DateTime.now().toLocal().year;
    final splitNumberDate = date.toString().split("/");
    final day = splitNumberDate[0], month = splitNumberDate[1];
    final dateToParse = "$year-$month-$day";
    final int weekDay = DateTime.parse(dateToParse).weekday;

    return getWeekdayWithDayCode(weekDay);
  }

  static String getMilitaryTimeFromStandardTime(String standardTime) {
    final splitStandardTime = standardTime.split(" ");
    final String time = splitStandardTime[0], timeType = splitStandardTime[1];
    final splitTimeOnly = time.split(":");
    int hour = int.parse(splitTimeOnly[0]),
        minute = int.parse(splitTimeOnly[1]);

    if (timeType != "am" && timeType != "pm") {
      throw Exception("Unidade de tempo errada!");
    }

    if (hour < 12 && timeType == "pm") hour += 12;
    String formattedHour = "$hour", formattedMinute = "$minute";
    if (minute < 10) formattedMinute = "0$formattedMinute";

    return "$formattedHour:$formattedMinute";
  }

  static double windSpeedTextToValue(String windSpeedText) {
    return double.parse(windSpeedText.toString().split(" ").first);
  }

  static String formatStringNameToCloudFormat(String cityName) {
    return cityName.replaceFirst(",", " - ");
  }

  static String fullDateWithWeekdayAndDate(String weekday, String writtenDate) {
    return "$weekday $writtenDate";
  }
}
