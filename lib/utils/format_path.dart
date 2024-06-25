String formatPath(String path) {
  List<String> segments =
      path.split("/").where((segment) => segment.isNotEmpty).toList();

  if (segments.isNotEmpty) {
    String lastSegment = segments.last;

    if (lastSegment.isNotEmpty) {
      return lastSegment[0].toUpperCase() + lastSegment.substring(1);
    }
  }

  return "";
}
