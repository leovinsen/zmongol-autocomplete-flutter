

  class Decomposer {
    final Node root;

      Decomposer(): this.root = new Node() {
        this.build();
    }

    private void build() {
        if (CollectionUtils.isEmpty(KeyboardLayout.getKeys())) {
            return;
        }
        Node current;
        String str;
        Node endNode;
        for (String key : KeyboardLayout.getKeys()) {
            if (Strings.isBlank(key)) {
                continue;
            }
            current = root;
            str = key;
            for (int i = 0; i != str.length(); i++) {
                Character character = str.charAt(i);
                if (!current.contain(character)) {
                    current.put(character);
                }
                if (i == str.length() - 1) {
                    endNode = current.get(character);
                    endNode.setEnd(true);
                    endNode.setKey(key);
                }
                current = current.get(character);
            }
        }
    }

      List<List<String>> decompose(final String str) {
        long time1 = Instant.now().toEpochMilli();
        try {
            return this.decompose(new ArrayList<>(8), str);
        } finally {
            logger.info("decompose run time:{}", Instant.now().toEpochMilli() - time1);
        }
    }

    private List<List<String>> decompose(final List<String> prefixes, final String str) {
        List<List<String>> cases = new ArrayList<>(8);
        if (Strings.isBlank(str)) {
            cases.add(prefixes);
            return cases;
        }

        List<Node> matchedNodes = this.check(str);
        if (CollectionUtils.isEmpty(matchedNodes)) {
            cases.addAll(decompose(prefixes, str.substring(1)));
            return cases;
        }
        for (Node matchedNode : matchedNodes) {
            List<String> newPrefixes = new LinkedList<>(prefixes);
            newPrefixes.add(matchedNode.getKey());
            cases.addAll(decompose(newPrefixes, str.substring(matchedNode.key.length())));
        }
        return cases;
    }

    private List<Node> check(final String str) {
        if (Strings.isBlank(str)) {
            return null;
        }
        char c;
        Node current = root;
        List<Node> matchNodes = new LinkedList<>();
        for (int i = 0; i != str.length(); i++) {
            c = str.charAt(i);
            current = current.get(c);
            if (current != null && current.isEnd()) {
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
            this.key = key;
          }

          void set isEnd(bool isEnd) {
            this.isEnd = isEnd;
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