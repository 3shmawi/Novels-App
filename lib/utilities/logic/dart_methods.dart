String createNewId() => DateTime.now().toIso8601String();

String getErrorMessage(String error) {
  for (int i = 0; i < error.length; i++) {
    if (error[i] == ']') {
      return error.substring(i + 2);
    }
  }
  return error;
}

bool isFirstCharArabic(String text) {
  int char = text.codeUnitAt(0);
  if (char >= 0x0600 && char <= 0x06E0) {
    return true;
  }
  return false;
}
