extension ColumnAround on String {
  String addComma() {
    // ignore: unnecessary_this
    return this.replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');
  }
}
