import 'package:html_unescape/html_unescape.dart';

class StringResource {
  static String description =
      "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available";

  static String baseUrl =
      'https://api.rawg.io/api/games?page=1&page_size=20&platforms=187&dates=2020-05-18,2021-05-18&ordering=-released&key=6eaf82e6cd264cbd9ea5950dd863e5dc';

  static String gameDetailUrl =
      'https://api.rawg.io/api/games/287342?key=6eaf82e6cd264cbd9ea5950dd863e5dc';
}

String removeHtmlTags(String htmlString) {
  // Unescape HTML entities
  var unescape = HtmlUnescape();
  var unescapedString = unescape.convert(htmlString);

  // Remove <p> and <br/> tags
  return unescapedString.replaceAll(RegExp(r'<p>|<\/p>|<br\s*\/?>'), '');
}
