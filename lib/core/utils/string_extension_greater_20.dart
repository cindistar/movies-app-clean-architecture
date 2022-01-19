extension StringExtension20 on String {
  String wordTrim20() {
    return length > 20 ? '${substring(0, 20)}...' : this;
  }
}
