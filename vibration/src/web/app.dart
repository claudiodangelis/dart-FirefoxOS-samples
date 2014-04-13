import 'dart:html';
import 'dart:js';

main() {
  querySelector('#btn').onClick.listen((e) {
    context['navigator'].callMethod('vibrate', [200]);
  });
}