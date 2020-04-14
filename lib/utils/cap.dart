extension StringExtension on String {
    String cap() {
      return "${this[0].toUpperCase()}${this.substring(1)}";
    }
}