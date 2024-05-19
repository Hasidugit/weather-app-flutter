String selectImage(String condition) {
  switch (condition) {
    case "Torrential rain shower":
      return "images/vecteezy_3d-weather-icon-day-with-rain_24825182.png";
    case "Moderate or heavy rain shower":
      return "images/vecteezy_3d-weather-icon-day-with-rain_24825182.png";
    default:
      return "images/vecteezy_3d-weather-icon-day-with-rain_24825182.png"; // Default image if condition is not matched
  }
}
