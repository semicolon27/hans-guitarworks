class MathUtil {
  static double percent(double value, double percent) {
    return value - (value * (percent / 100));
  }
}
