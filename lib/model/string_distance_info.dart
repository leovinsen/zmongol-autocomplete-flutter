import 'mount_object.dart';

class StringDistanceInfo {
  final int distance;
  final MountObject mountObject;

  const StringDistanceInfo(this.distance, this.mountObject);

  int getDistance() {
    return distance;
  }

  MountObject getMountObject() {
    return mountObject;
  }
}
