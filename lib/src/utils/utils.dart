class Utils {
  static bool isNumber({String? string}) {
    if (string == null) {
      return false;
    }
    return double.tryParse(string) != null;
  }
}
