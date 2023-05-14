/**
 * Classes
 * 
 * Class에서 property를 선언할 때는 타입을 사용해서 정의
 * -> function 내에서 variable을 사용할 때는 var를 사용
 * 
 * var player = new Player();
 * -> 다음처럼 Class 앞에 new를 붙여도 됨, 일반적으로는 생략함
 * 
 * Java처럼 메소드 내에서 호출하는 필드변수 앞에 this를 붙여도 됨
 * -> Class method 내에서의 this를 사용하지 않는 것이 권고되어 있음,
 * method 내에서 같은 이름의 variable가 있어서 어쩔 수 없을 경우에만 사용
 * 
 * 클래스 생성자도 함수처럼 Positional Parameter, Named Parameter로 구분
 * -> 역시나 너무 많은 Positional Parameter는 혼란스러워짐,
 * Named Parameter로 혼란 방지
 * 
 * Named Constructor는 생성자에 이름과 역할을 부여하는 방식으로
 * 기존 생성자에 비해서 더 명시적인 방식
 * => 자바의 생성자 오버로딩(다형성을 위해 같은 이름의 메소드를 재정의)과 비슷함,
 * 다만 메소드의 이름이 다름을 이용하여 역할을 구분함
 */
void main(List<String> args) {
  var playerLate = PlayerLate('jaehane', 1500);
  var playerLate2 = PlayerLate('john', 2500);

  var player = Player('nico', 3000, 'red', 12);
  var player2 = Player('lynn', 2500, 'blue', 12);

  var namedParamPlayer = NamedParamPlayer(
    name: 'nico',
    xp: 1200,
    team: 'blue',
    age: 21,
  );

  var namedParamPlayer2 = NamedParamPlayer(
    name: 'nico',
    xp: 1200,
    team: 'blue',
    age: 21,
  );

  print(playerLate.name);
  // playerLate.name = 'nico';
  // print(playerLate.name);

  playerLate.sayHello();
  playerLate2.sayHello();

  player.sayHello();
  player2.sayHello();

  namedParamPlayer.sayHello();
  namedParamPlayer2.sayHello();

  var bluePlayer = NamedConstructPlayer.createBluePlayer(
    name: 'jaehan',
    age: 28,
  );
  var redPlayer = NamedConstructPlayer.createRedPlayer('nico', 30);

  bluePlayer.sayHello();
  redPlayer.sayHello();
}

class PlayerLate {
  late final String name; // late를 사용해서 변수 초기화를 나중에 함
  late int xp;

  PlayerLate(String name, int xp) {
    this.name = name;
    this.xp = xp;
  }

  void sayHello() {
    // var name = 'john';

    print("Hi, my name is $name");
  }
}

class Player {
  final String name;
  int xp, age;
  String team;

  // late 없이 더 간단한 생성자
  Player(
    this.name,
    this.xp,
    this.team,
    this.age,
  );

  void sayHello() {
    // var name = 'john';

    print("Hi, my name is $name");
  }
}

class NamedParamPlayer {
  final String name;
  int xp, age;
  String team;

  NamedParamPlayer({
    required this.name,
    required this.xp,
    required this.team,
    required this.age,
  });

  void sayHello() {
    print("Hi, my name is $name");
  }
}

class NamedConstructPlayer {
  final String name;
  int xp, age;
  String team;

  NamedConstructPlayer.createBluePlayer({
    required String name,
    required int age,
  })  : this.name = name,
        this.xp = 0,
        this.age = age,
        this.team = 'blue';

  NamedConstructPlayer.createRedPlayer(String name, int age)
      : this.name = name,
        this.xp = 0,
        this.age = age,
        this.team = 'red';

  void sayHello() {
    print("Hi, my name is $name");
  }
}
