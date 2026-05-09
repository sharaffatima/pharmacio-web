import 'dart:html' as html;

class WebStorage {
  String? getItem(String key) => html.window.sessionStorage[key];

  void setItem(String key, String value) {
    html.window.sessionStorage[key] = value;
  }

  void removeItem(String key) {
    html.window.sessionStorage.remove(key);
  }

  void clear() {
    html.window.sessionStorage.clear();
  }
}
