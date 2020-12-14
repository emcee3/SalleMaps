extension CompareStrings on String {
  bool containsIgnoreCase(String value) {
    return this.toLowerCase().contains(value.toLowerCase());
  }
}
