class GlobalStrings {
  // Declare a static variable
  static String _globalString = "";

  // Setter method to update the global string
  static void setGlobalString(String value) {
    _globalString = value;
    print("set Success");
  }

  // Getter method to retrieve the global string
  static String getGlobalString() {
    return _globalString;
  }
}
