void nullSafeAssignmentClassical(int? x) {
  if (x == null) {
    x = 10;
  }
  print(x);
}

void nullSafeAssignmentOperator(int? x) {
  x ??= 10;
  print(x);
}

void nullSafeConditionalInvokationClassical(List<String>? list) {
  if (list != null) {
    print(list.length);
  } else {
    print(0);
  }
}

void nullSafeConditionalInvokationOperator(List<String>? list) {
  print(list?.length ?? 0);
}