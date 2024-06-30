import 'package:webfeed/domain/rss_item.dart';

class Article {
  // Attributes
  String? _title;
  String? _description;
  DateTime? _pubDate;
  String? _imageUrl;
  String? _urlLink;

  // Getters
  String get title => _title ?? "vide";
  String get description => _description ?? "vide";
  DateTime get date => _pubDate ?? DateTime.now();
  String get imageUrl => _imageUrl ?? "";
  String get link => _urlLink ?? "";

  // Constructor
  Article({required RssItem item}) {
    _title = item.title;
    _description = item.description;
    _pubDate = item.pubDate;
    _imageUrl = item.enclosure?.url;
    _urlLink = item.link;
  }

}