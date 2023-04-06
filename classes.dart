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
 */
void main(List<String> args) {
  var playerLate = PlayerLate('jaehane', 1500);
  var playerLate2 = PlayerLate('john', 2500);
  var player = Player('nico', 3000);

  print(playerLate.name);
  // playerLate.name = 'nico';
  // print(playerLate.name);

  playerLate.sayHello();
  playerLate2.sayHello();
  player.sayHello();
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
  int xp;

  Player(this.name, this.xp); // late 없이 더 간단한 생성자

  void sayHello() {
    // var name = 'john';

    print("Hi, my name is $name");
  }
}
