class Windows {
  final int version;

  Windows(this.version);

  // If needed, we can also have parameters here. We can also return instances of other classes.
  factory Windows.seven() {
    return Windows(7);
  }

  factory Windows.eight() {
    return Windows(8);
  }
}

extension Support on Windows {
  bool supportsSomeFeature() {
    return false;
  }
}

void main() {
  Windows newestWindows = Windows(11);
  Windows bestWindows = Windows.eight();

  print(newestWindows.version);
  print(bestWindows.version);
  print(newestWindows.supportsSomeFeature());
}