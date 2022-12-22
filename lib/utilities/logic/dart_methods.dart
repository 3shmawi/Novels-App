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

String makeFirstUpper(String text) {
  return text[0].toUpperCase() + text.substring(1);
}

String makeNameUpper(String text) {
  String name = text[0].toUpperCase();
  for (int i = 1; i < text.length-1; i++) {
    name += text[i];
    if (text[i] == ' ' && i != text.length) {
      name += text[i + 1].toUpperCase();
      i++;
    }
  }
  name += text[text.length-1];
  return name;
}

String getTwoDecimalDouble(String value) {
  for (int i = 0; i < value.length; i++) {
    if (value[i] == '.') {
      if (value.length == i + 2 && value[i + 1] == '0') {
        return '${value.substring(0, i)}.0';
      }
      return value.substring(0, i + 2);
    }
  }

  return value;
}

String daysBetween(DateTime date) {
  if (DateTime.now().difference(date).inDays <= 5) {
    if ((DateTime.now().difference(date).inHours / 24).round() == 0) {
      if (DateTime.now().difference(date).inHours == 0) {
        if (DateTime.now().difference(date).inMinutes == 0) {
          return 'now';
        } else {
          return '${DateTime.now().difference(date).inMinutes.toString()}m';
        }
      } else {
        return '${DateTime.now().difference(date).inHours.toString()}h';
      }
    } else {
      return (' ${(DateTime.now().difference(date).inHours / 24).round().toString()}d');
    }
  } else {
    return 'date';
  }
}
