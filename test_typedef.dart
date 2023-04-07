void main() {
  var test = caculate([1, 2, 3, 4, 10], sum);

  print(test);
  print(test.runtimeType);
}

typedef Operation = double Function(List<double> list);

double caculate(List<double> list, Operation operation) {
  return operation(list);
}

double sum(List<double> list) {
  double result = 0;

  for (int i = 0; i < list.length; i++) {
    result += list[i];
  }

  return result;
}

double sub(List<int> list) {
  double result = 0;

  for (int i = 0; i < list.length; i++) {
    result -= list[i];
  }

  return result;
}

double multi(List<double> list) {
  double result = list[0];

  for (int i = 0; i < list.length; i++) {
    result *= list[i];
  }

  return result;
}

double divide(List<double> list) {
  double result = list[0];

  for (int i = 0; i < list.length; i++) {
    result /= list[i];
  }

  return result;
}
