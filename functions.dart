/**
 * dart에서 함수도 객체이며 타입을 Function으로 갖음
 * 
 * dart에서 함수의 파라미터 형식은 두 가지
 * -> positional parameter, named parameter
 * 
 * 기존 파라미터 형태(positional parameter)는
 * 파라미터의 순서나 어떤 의미를 갖는 데이터인지 파악하기 어려움
 * -> func(int a, int b, int c)
 * -> "Clean Code"에서는 파라미터의 불분명을 최소화 해야 한다고 함,
 * 특히 해당 함수가 같은 파일에 있지 않고 다른 파일에 존재하는 경우
 * 이해에 어려움이 있음
 * 
 * named parameter를 통해 순서에 기억하거나 구애받지 않고
 * 파라미터를 더 명확히 할 수 있음
 * -> func(int firstNum, int secondNum, int thirdNum)
 * 
 * named parameter 형식을 사용할 때
 * 정의한 함수 파라미터와 다르게
 * 사용자가 일부 값을 안 보내는 경우가 존재함
 * (dart의 null safety 오류 발생)
 * -> 인수(argument)에 기본값을 정해놓는 방법,
 * required 키워드를 사용하여 필수로 값을 넣게 하는 방법
 * 
 * Optional Positional Parameter
 * positional parameter에 [String? test = "default"] 형식으로 사용
 * -> 기본적으로 positional parameter는 required인 파라미터
 * -> 자주 사용하지 않을 수 있음
 * 
 * Null-aware operator ( ??, ??= )
 * 
 * ?? operator
 * '좌항 ?? 우항' 형식으로 좌항의 값이
 * null이 아니면 좌항을 리턴, null이면 우항을 리턴
 * 
 * ??= operator
 * '타입 변수이름 ??= 값' 형식으로 변수값이 null이라면 해당 값을 할당
 * 
 * typedef
 * 자료형이 헷갈릴 때 도움이 되도록 사용자가 원하는 alias를 만드는 키워드,
 * 좀 더 간단한 데이터의 alias를 만들 때 사용함 -> List<int> 등
 */
void main(List<String> args) {
  // API 호출
  // 계산 진행
  print(sayHello('jaehan'));
  print(sayHelloArrow('nico'));
  print(plus(3, 4));

  print(sayHelloUser('세종', 40, '조선'));

  // 순서는 상관없음
  print(defaultNamedUser(
    age: 40,
    country: '조선',
    name: '세종',
  ));
  print(defaultNamedUser()); // 기본값으로 출력됨

  print(requiredNamedUser(
    name: "jaehan",
    age: 30,
    country: "Korea",
  ));
  // print(requiredNamedUser()); // 컴파일하지 않음

  var optionalResult = optionalNamedUser("nico", 17);
  print(optionalResult);

  print(normalCapitalizeName('jaehane'));
  print(arrowCapitalizeName('jaehane'));
  print(anotherCapitalizeName('jaehane'));

  print(mayBeNullName('nico').toUpperCase());

  print(reverseListOfNumbers([1, 2, 3]));
  print(sayHiMap({"name": "jaehan"}));
}

String sayHello(String name) {
  return "Hello $name nice to meet you!";
}

// 하나의 표현식
String sayHelloArrow(String name) => "Hello $name nice to meet you!";

num plus(num a, num b) => a + b;

// num 대신 int를 사용하는 이유는
// num은 정수(int)/실수(double) 둘 다 받기 때문임
String sayHelloUser(String name, int age, String country) {
  return "Hello $name, you are $age, and you come from $country.";
}

// 기본값 지정
String defaultNamedUser({
  String name = "Anonymous",
  int age = 99,
  String country = "Atlantis",
}) {
  return "Hello $name, you are $age, and you come from $country.";
}

// required 키워드 지정
String requiredNamedUser({
  required String name,
  required int age,
  required String country,
}) {
  return "Hello $name, you are $age, and you come from $country.";
}

// Optional Positional Parameter
String optionalNamedUser(String name, int age, [String? country = "cuba"]) =>
    "Hello $name, you are $age, and you come from $country.";

String normalCapitalizeName(String? name) {
  if (name != null) {
    return name.toUpperCase();
  }
  return 'anonymous';
}

String arrowCapitalizeName(String? name) =>
    name != null ? name.toUpperCase() : 'anonymous';

String anotherCapitalizeName(String? name) =>
    name?.toUpperCase() ?? 'anonymous';

String mayBeNullName(String name) {
  String? result;
  result ??= 'nico';
  // result ??= 'john';
  // -> 위에서 변수값을 이미 할당했기에 null값이 오지 않음
  return result;
}

typedef ListOfInts = List<int>;

// 다음과 같이 만들 수도 있지만
// 구조화된 data의 형태를 지정해야 하면
// 차라리 클래스를 만드는 것이 더 좋음
typedef UserInfo = Map<String, String>;

ListOfInts reverseListOfNumbers(ListOfInts list) {
  // List를 reversed하면 iterable이 되어서
  // toList()로 다시 List로 변환해야 함
  var reversed = list.reversed;
  return reversed.toList();
}

String sayHiMap(UserInfo userInfo) {
  return "Hi ${userInfo['name']}";
}
