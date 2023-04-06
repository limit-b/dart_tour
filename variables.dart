/**
 * 변수
 * 
 * var 키워드
 * -> 관습적으로 함수나 메소드 내부에 지역 변수를 선언할 때에 var 사용
 * 
 * int 타입, double 타입, String 타입
 * -> 관습적으로 클래스에서 변수나 속성(property)를 선언할 때
 * 변수의 타입을 지정
 * 
 * dynamic 타입
 * -> 엄격한 타입 규칙을 조금 회피할 수 있도록
 * 여러 타입을 가질 수 있게 하는 타입
 * -> 변수가 어떤 타입일지 알기 어려운 경우,
 * flutter나 json이랑 함께 작업하는 경우
 * -> 이상적으로는 사용을 피해야 하고, 정말 필요로 하는 경우에만 사용
 * 
 * NULL Safety
 * -> 개발자가 null값을 참조할 수 없도록 하는 기능,
 * null값을 참조하여 발생하는 런타입 에러를 컴파일 단계에서 방지할 수 있게 함
 * 
 * final 키워드
 * -> javascript의 const 키워드와 비슷함,
 * 어떤 값인지 모르거나 값이 API로부터 오거나
 * 사용자가 화면에서 입력해야 하는 값의 경우에 final이나 var 사용
 * 
 * late 키워드
 * -> API 요청으로 받은 데이터를 변수에 지정하기 위해
 * 초기화 없이 변수를 선언할 수 있게 함,
 * flutter에서 data fetching을 할 때에 유용함
 * 
 * const 키워드
 * -> final과 같이 상수를 선언할 때 사용,
 * 다만 compile-time에 알고 있는 값이어야 함,
 * 한마디로 앱을 배포하기 전 알고 있는 값을 말함
 */
void main(List<String> args) {
  var myName = '재한';
  // myName = 1;
  // myName = true;
  // myName = false;
  myName = 'jaehan'; // 오로지 하나의 타입

  String yourName = '니꼬';

  print('$myName, $yourName');

  // 변수를 var로 선언하고 초기화하지 않으면 dynamic 타입이 된다
  var dynam_variable;

  dynam_variable = 'cat';
  dynam_variable = 1;
  dynam_variable = true;
  dynam_variable = false;

  // dynamic 변수를 타입 체크하는 if문
  // -> 이 경우 해당 타입에 해당하는 메소드들이 활성화된다
  if (dynam_variable is String) {
    // String인 경우
    print(dynam_variable.split(','));
  } else if (dynam_variable is int) {
    // int인 경우
    print(dynam_variable.floor());
  }

  // dart의 변수는 기본적으로 non-nullable
  // -> nullable이려면 타입?로 표현
  String? petName = '흰둥이'; // String 또는 null
  petName = null;

  // if (petName != null) {
  // petName.length;
  // petName.isNotEmpty;
  // }
  petName?.length;
  petName?.isNotEmpty;

  final friendName = '지수';
  // friendName = '제니';
  final int friendAge = 20; // 타입은 생략 가능

  print('$friendName $friendAge');

  // late 키워드를 사용하면 final로 선언해도 나중에 데이터 넣을 수 있음
  // -> 한 번만 할당할 수 있음
  late final String apiData;
  // ... API 데이터 수신 ...
  // print(apiData); // 값을 넣기 전에는 접근하지 못함
  apiData = 'API 데이터';

  print(apiData);

  const idolName = '지수';
  // idolName = '제니';
  const int idolAge = 20; // 타입은 생략 가능
  const max_allowed_price = 120; // 최대값을 상수로 표현할 때 사용

  print('$idolName $idolAge $max_allowed_price');
}
