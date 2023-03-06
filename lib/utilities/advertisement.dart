import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;

Future<List<String>> getPostData() async {
  final response = await http
      .get(Uri.parse('https://www.greenpeace.org/korea/make-a-change/'));
  final document = parser.parse(response.body);
  final List<String> divs = [];

  document.getElementsByTagName('div').forEach((element) {
    final String? style = element.attributes['style'];
    if (style != null) {
      String imgSrc = element.attributes.toString();

      int srcStart = imgSrc.indexOf('(');
      int end = imgSrc.indexOf(')');

      if (srcStart == -1 || end == -1) {
        print('object');
      } else {
        divs.add(imgSrc.substring(srcStart + 1, end));
      }
    }
  });
  print('$divs');
  return divs;
}
