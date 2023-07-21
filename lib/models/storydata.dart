// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

@immutable
class StoryData {
  const StoryData({
    required this.name,
    required this.url,
  });

  final String name;
  final String url;
}