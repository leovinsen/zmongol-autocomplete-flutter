import 'package:ime_mongol_package/keyboard/keyboard_layout.dart';

class Decomposer {
  final Node root;

  Decomposer() : this.root = new Node() {
    this._build();
  }

  void _build() {
    if (KeyboardLayout.getKeys().isEmpty) {
      return;
    }
    Node current;
    String str;
    Node endNode;
    for (String key in KeyboardLayout.getKeys()) {
      if (key.isEmpty) {
        continue;
      }
      current = root;
      str = key;
      for (int i = 0; i != str.length; i++) {
        String character = str.substring(i, i + 1);
        if (!current.contain(character)) {
          current.put(character);
        }
        if (i == str.length - 1) {
          endNode = current.get(character)!;
          endNode.isEnd = true;
          endNode.key = key;
        }
        current = current.get(character)!;
      }
    }
  }

  List<List<String>> decompose(final String str) {
    // int time1 = DateTime.now().millisecondsSinceEpoch;
    try {
      return this._decompose([], str);
    } finally {
      // print(
      //     'decompose runtime: ${DateTime.now().millisecondsSinceEpoch - time1}ms');
    }
  }

  List<List<String>> _decompose(
      final List<String> prefixes, final String? str) {
    List<List<String>> cases = [];
    if (str == null || str.isEmpty) {
      cases.add(prefixes);
      return cases;
    }

    List<Node>? matchedNodes = this._check(str);
    if (matchedNodes == null || matchedNodes.isEmpty) {
      cases.addAll(_decompose(prefixes, str.substring(1)));
      return cases;
    }

    for (Node matchedNode in matchedNodes) {
      List<String> newPrefixes = List.from(prefixes);
      newPrefixes.add(matchedNode.key!);
      cases.addAll(
          _decompose(newPrefixes, str.substring(matchedNode.key!.length)));
    }
    return cases;
  }

  List<Node>? _check(final String? str) {
    if (str == null || str.isEmpty) {
      return null;
    }
    String c;
    Node? current = root;
    List<Node> matchNodes = [];
    for (int i = 0; i != str.length; i++) {
      c = str.substring(i, i + 1);
      current = current?.get(c);
      if (current != null && current.isEnd) {
        matchNodes.add(current);
      }
      if (current == null) {
        break;
      }
    }
    return matchNodes;
  }
}

class Node {
  String? _key;
  bool _isEnd = false;
  final _children = Map<String, Node>();

  String? get key => this._key;
  bool get isEnd => this._isEnd;

  void set key(String? key) {
    this._key = key;
  }

  void set isEnd(bool isEnd) {
    this._isEnd = isEnd;
  }

  Node? get(String character) {
    return _children[character];
  }

  bool contain(String character) {
    return this._children.containsKey(character);
  }

  void put(String character) {
    _children[character] = new Node();
  }
}
