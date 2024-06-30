import 'package:http/http.dart' as http;
import 'package:rss_app/models/articles.dart';
import 'package:webfeed/domain/rss_feed.dart';


class FeedParser {
    Future<List<Article>> getFeed() async {
      List<Article> articles = [];
      const String urlString = "https://www.francebleu.fr/rss/belfort-montbeliard/a-la-une.xml";
      final client = http.Client(); // le client http qui effectuera les requette http
      final url = Uri.parse(urlString); //transformer le string en url valide
      final clientResponse = await client.get(url)
          .then((value) => value.body);

      final rssFeed = RssFeed.parse(clientResponse);
      final items = rssFeed.items;
      if (items != null) {
         articles = items.map((item) => Article(item: item)).toList();
      }
      return articles;

  }

}