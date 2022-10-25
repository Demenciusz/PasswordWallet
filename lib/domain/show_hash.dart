class ShowHash {
  static String show(String text) {
    String x = '';
    for (var i = 0; i < text.length; i++) {
      x = x + '*';
    }
    return x;
  }
}
