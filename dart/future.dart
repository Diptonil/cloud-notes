void main() async {
  // Due to use of await, int is returned here.
  final resultData = await getComputedValue(10);
  // Due to no use of await, Future object is returned here.
  final resultObjectState = getComputedValue(10);

  print(resultData);
  print(resultObjectState);
}

Future<int> getComputedValue(int number) {
  return Future.delayed(const Duration(seconds: 5), () => number * number + number);
}