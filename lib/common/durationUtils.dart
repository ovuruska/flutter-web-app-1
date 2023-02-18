String serialize(Duration duration) {
  return "${duration.inHours}:${duration.inMinutes.remainder(60)}:00";
}

Duration deserialize(String duration) {
  var parts = duration.split(":");
  return Duration(hours: int.parse(parts[0]), minutes: int.parse(parts[1]));
}