import 'dart:math';

import 'package:ime_mongol_package/model/mount_object.dart';
import 'package:ime_mongol_package/model/string_distance_info.dart';

import 'levenshtein_distance.dart';

class BurkhardKellerTree {
  final Node root;

  BurkhardKellerTree(MountObject rootMount) : root = Node(rootMount) {
    root.isRoot = true;
  }

  void addAll(List<MountObject> mountObjectList) {
    if (mountObjectList.isEmpty) {
      return;
    }
    for (MountObject mountObject in mountObjectList) {
      if (mountObject.getString().isNotEmpty) {
        this._mount(root, mountObject);
      }
    }
  }

  void add(final MountObject mountObject) {
    if (mountObject.getString().isNotEmpty) {
      this._mount(root, mountObject);
    }
  }

  void _mount(final Node node, final MountObject mountObject) {
    int d = getLevenshteinDistance(
        node.mountObject.getString(), mountObject.getString());
    if (d == 0) {
      return;
    }
    Node? child = node.getChild(d);
    if (child == null) {
      node.putChild(d, new Node(mountObject));
    } else {
      _mount(child, mountObject);
    }
  }

  List<StringDistanceInfo> matching(final String str, final int n) {
    var matchedList = <StringDistanceInfo>[];
    this._match(matchedList, root, str, n);
    return matchedList;
  }

  void _match(
    final List<StringDistanceInfo> list,
    final Node node,
    final String str,
    final int n,
  ) {
    int time1 = DateTime.now().millisecondsSinceEpoch;

    int d = getLevenshteinDistance(node.mountObject.getString(), str);

    if (d <= n && !node.isRoot) {
      list.add(
        StringDistanceInfo(d, node.mountObject),
      );
    }

    if (node.children.isEmpty) {
      return;
    }

    for (int i = max(0, d - n); i <= d + n; i++) {
      if (node.children.containsKey(i)) {
        _match(list, node.getChild(i)!, str, n);
      }
    }
    int time2 = DateTime.now().millisecondsSinceEpoch;
    // print('match completed in ${time2 - time1}');
  }
}

class Node {
  final MountObject mountObject;
  bool isRoot = false;

  static const maxDistance = 50;

  final Map<int, Node> children = <int, Node>{};

  Node(this.mountObject);

  void putChild(final int distance, final Node child) {
    this.children[distance] = child;
  }

  Node? getChild(final int distance) {
    if (this.children.isEmpty) {
      return null;
    }
    return this.children[distance];
  }
}
