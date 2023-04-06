/**
 * 기본 자료 유형(Basic Data Types)
 * -> String, int, double, num, bool
 * -> 기본 타입과 함수(Function) 등
 * 거의 대부분이 객체(Class 또는 Object)
 * 
 * num 타입
 * -> int와 double 타입 둘 다 가능함, 많이 사용하지 않음
 * 
 * 가능하면 var 사용,
 * 클래스를 다룰 때 멤버변수(필드변수)는 자료형 명시
 * 
 * Collection If
 * -> 임의의 조건문의 조건이 참인 경우 배열에 값을 추가함
 * -> [ '철수', if(true) '영희' ]
 * 
 * String Interpolation
 * 일반 -> 'Hello, $name';
 * 계산 -> 'result: ${a + b}';
 * 
 * Collection For
 * -> 임의의 반복문의 조건이 참인 경우 배열에 값을 추가함
 * -> ['철수', for(var item in ['영희', '민수']) '$item'];
 * 
 * UI 인터페이스를 만들 때,
 * Collection If와 Collection For를 이용하면 유용함
 * -> 메뉴나 네비게이션바를 만들 때,
 * 사용자가 로그인을 했는지 나타내는 버튼을 추가하는 경우에 이용
 * 
 * Map
 * -> 다트/플러터에서 Map을 많이 사용하지 않는게 나을 수 있음
 * -> player나 movie처럼 API 구조의 데이터로 Class를 사용
 * 
 * Set
 * -> 파이썬의 딕셔너리처럼 중괄호를 사용하지만, 파이썬의 튜플과 같음
 */
void main(List<String> args) {
  String name = 'jaehan'; // "jaehan" -> 쌍따옴표도 가능
  int age = 12;
  double money = 69.99;
  num x = 12;
  x = 1.1;
  bool alive = true;

  print('$name, $age, $money, $x, $alive');

  // List의 마지막에 쉼표로 마무리하면 여러 줄로 포매팅됨
  var giveMeFive = true;
  var numbers = [
    1,
    2,
    3,
    4,
    if (giveMeFive) 5, // collection if 기능
  ];

  // Collection If와 동일한 기능
  // if (giveMeFive) {
  // numbers.add(5);
  // }
  // numbers.add('jaehan');
  numbers.add(6);

  print(numbers);
  print(numbers.runtimeType); // List<int> 타입
  print(numbers.first);
  print(numbers.last);

  var yourName = '철수';
  var yourAge = 10;
  var greeting1 = 'Hello everyone, my name is $yourName.';
  var greeting2 = 'I\'m ${yourAge + 2}';

  print(greeting1);
  print(greeting2);

  var oldFriends = ['nico', 'lynn'];
  var newFriends = [
    'lewis',
    'ralph',
    'darren',
    for (var friend in oldFriends) '💖 $friend',
  ];

  // Collection For과 동일한 기능
  // for (var friend in oldFriends) {
  //   newFriends.add('💖 $friend');
  // }

  print(newFriends);

  // Map은 {key: value} 형식
  var player = {
    'name': 'limit',
    'xp': 19.99,
    'superpower': false,
  };

  Map<int, bool> testMap = {
    1: true,
    2: false,
    3: true,
  };

  Map<List<int>, bool> listMap = {
    [1, 2, 3, 5]: true,
  };

  List<Map<String, Object>> mapList = [
    {'name': 'limit', 'xp': 199993.999},
    {'name': 'limit', 'xp': 199993.999},
  ];

  print(player);
  print(testMap);
  print(listMap);
  print(mapList);

  var numberSet1 = {1, 2, 3, 4};
  Set<int> numberSet2 = {1, 2, 3, 4};

  //
  numberSet1.add(1);
  numberSet1.add(1);
  numberSet1.add(1);

  print(numberSet1);
  print(numberSet2);
}
