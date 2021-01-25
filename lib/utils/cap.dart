extension StringExtension on String {
  String cap() {
    // ignore: unnecessary_this
    return '${this[0].toUpperCase()}${this.substring(1)}';
  }
}
