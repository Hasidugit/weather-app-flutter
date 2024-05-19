String getUVIndexLevel(double uvIndex) {
  if (uvIndex < 3) {
    return 'Low';
  } else if (uvIndex >= 3 && uvIndex < 6) {
    return 'Moderate';
  } else if (uvIndex >= 6 && uvIndex < 8) {
    return 'High';
  } else if (uvIndex >= 8 && uvIndex < 11) {
    return 'Very High';
  } else {
    return 'Extreme';
  }
}

String getUVIndexMessage(double uvIndex) {
  String level = getUVIndexLevel(uvIndex);
  if (level == 'Moderate' ||
      level == 'High' ||
      level == 'Very High' ||
      level == 'Extreme') {
    return 'Use sun protection.';
  } else {
    return '';
  }
}
