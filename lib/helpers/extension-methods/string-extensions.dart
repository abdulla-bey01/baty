extension StringExtensions on String {
  bool get isNullorWhiteSpace {
    return this.isEmpty || this.trim().isEmpty;
  }
}
