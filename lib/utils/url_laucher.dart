import 'package:url_launcher/url_launcher.dart';

class UrlLaucherApp {
  UrlLaucherApp._();

  static void abrirUrl(String url) async {
    if (!await launchUrl(Uri.parse(url),
        mode: LaunchMode.externalApplication)) {
      throw Exception('No se puedo abrir la url: $url');
    }
  }

  static String? _encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  static final _email = Uri(
    scheme: 'mailto',
    path: '105.3fm@correounivalle.edu.co',
    query: _encodeQueryParameters(<String, String>{
      'subject': 'Información',
    }),
  );
  static void abirEmail() async {
    if (!await launchUrl(_email, mode: LaunchMode.externalApplication)) {
      throw Exception('No se puedo abrir el correo');
    }
  }
}
