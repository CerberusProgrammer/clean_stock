String formatPath(String path) {
  String newPath = path.replaceAll("/", "");

  if (newPath.isNotEmpty) {
    newPath = newPath[0].toUpperCase() + newPath.substring(1);
  }

  return newPath;
}
