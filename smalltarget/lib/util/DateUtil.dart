/// 日期工具类
/// author liushuang@gmail.com
class DateUtil {

  ///获取当日是星期几
  /// * static const int monday = 1;
  /// * static const int tuesday = 2;
  /// * static const int wednesday = 3;
  /// * static const int thursday = 4;
  /// * static const int friday = 5;
  /// * static const int saturday = 6;
  /// * static const int sunday = 7;
  static getWeekDay() {
    return DateTime.now().weekday;
  }
}