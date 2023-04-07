void main(List<String> args) {
  // Idol blackPink = new Idol(DateTime.now().toString(), ["지수", "제니"]); // 됨
  // Idol blackPink = const Idol(DateTime.now().toString(), ["지수", "제니"]); // 안됨
  Idol blackPink = const Idol("블랙핑크", ["지수", "제니"]); // 됨

  Idol blackPink2 = new Idol("블랙핑크", ["지수", "제니"]);
  Idol blackPink3 = new Idol("블랙핑크", ["지수", "제니"]);
  Idol blackPink4 = const Idol("블랙핑크", ["지수", "제니"]);
  Idol blackPink5 = const Idol("블랙핑크", ["지수", "제니"]);

  print(blackPink.name);
  print(blackPink.members);

  print(blackPink2 == blackPink3);
  print(blackPink4 == blackPink5);
}

class Idol {
  final String name;
  final List<String> members;

  const Idol(this.name, this.members);

  Idol.fromList(List values)
      : this.name = values[1],
        this.members = values[0];

  void sayHello() {
    print("${this.name}");
  }
}

class Idol2 {
  String name;
  List<String> members;

  Idol2(this.name, this.members);

  Idol2.fromList(List values)
      : this.name = values[1],
        this.members = values[0];

  void sayHello() {
    print("${this.name}");
  }

  String get firstMember {
    return this.members[0];
  }

  set firstMember(String name) {
    this.members[0] = name;
  }
}
