/**
 * Make a 'Dictionary' class with the following methods:
 * 
 * - add : 단어를 추가함
 * - get : 단어의 정의를 리턴함
 * - delete : 단어를 삭제함
 * - update : 단어를 업데이트 함
 * - showAll : 사전 단어를 모두 보여줌
 * - count : 사전 단어들의 총 갯수를 리턴함
 * - upsert : 단어를 업데이트 함, 존재하지 않을 시 이를 추가함 (update + insert)
 * - exists : 해당 단어가 사전에 존재하는지 여부를 알려줌
 * - bulkAdd : 여러 개의 단어를 한번에 추가할 수 있게 해줌
 *     - 파라미터
 *         [
 *             {"term": "김치", "definition": "대박이네~"},
 *             {"term": "아파트", "definition": "비싸네~"},
 *         ]
 * - bulkDelete : 여러 개의 단어를 한번에 삭제할 수 있게 해줌
 *     - 파라미터 : ["김치", "아파트"]
 * 
 * Requirement
 * 
 * - Using Class
 * - Using typedef
 * - Using List
 * - Using Map
 */
void main(List<String> args) {
  var dictionary = Dictionary();

  dictionary.bulkAdd([
    {"term": "사과", "definition": "빨간 열매"},
    {"term": "바나나", "definition": "휘어진 열매"},
    {"term": "체리", "definition": "작은 열매"},
  ]);

  // 출력
  // [
  //   {"term": "사과", "definition": "빨간 열매"},
  //   {"term": "바나나", "definition": "휘어진 열매"},
  //   {"term": "체리", "definition": "작은 열매"},
  // ]
  dictionary.showAll();

  print(dictionary.count()); // 출력: 3
  print(dictionary.exists("사과")); // 출력: true

  print(dictionary.exists("오렌지")); // 출력: false
  dictionary.add(term: "오렌지", definition: "주스 열매");
  print(dictionary.exists("오렌지")); // 출력: true

  print(dictionary.get("바나나")); // 출력: 휘어진 열매
  dictionary.update(term: "바나나", definition: "노랗고 휘어진 열매");
  print(dictionary.get("바나나")); // 출력: 노랗고 휘어진 열매

  dictionary.upsert(term: "키위", definition: "초록 열매");
  print(dictionary.count()); // 출력: 5

  dictionary.delete("체리");

  // [
  //   {"term": "사과", "definition": "빨갛고 맛있는 열매"},
  //   {"term": "바나나", "definition": "휘어진 열매"},
  //   {"term": "오렌지", "definition": "주스 열매"},
  //   {"term": "키위", "definition": "초록 열매"},
  // ]
  dictionary.showAll();

  dictionary.bulkDelete(["사과", "오렌지", "파인애플"]);

  // [
  //   {"term": "바나나", "definition": "휘어진 열매"},
  //   {"term": "키위", "definition": "초록 열매"},
  // ]
  dictionary.showAll();
}

typedef WordList = List<Map<String, String>>;

class Dictionary {
  WordList wordList = [];

  // Read part
  bool exists(String term) {
    return wordList.any((word) => word["term"] == term);
  }

  String? get(String term) {
    var word =
        wordList.firstWhere((word) => word["term"] == term, orElse: () => {});
    return word["definition"] ?? null;
  }

  void showAll() {
    print(wordList);
  }

  int count() {
    return wordList.length;
  }

  // Create part
  void add({required String term, required String definition}) {
    wordList.add({"term": term, "definition": definition});
  }

  void bulkAdd(List<Map<String, String>> words) {
    wordList.addAll(words);
  }

  // Update part
  void update({required String term, required String definition}) {
    var index = wordList.indexWhere((word) => word["term"] == term);
    if (index >= 0) {
      wordList[index]["definition"] = definition;
    }
  }

  void upsert({required String term, required String definition}) {
    var index = wordList.indexWhere((word) => word["term"] == term);
    if (index != -1) {
      wordList[index]["definition"] = definition;
    } else {
      wordList.add({"term": term, "definition": definition});
    }
  }

  // Delete Part
  void delete(String term) {
    wordList.removeWhere((word) => word["term"] == term);
  }

  void bulkDelete(List<String> terms) {
    wordList.removeWhere((word) => terms.contains(word["term"]));
  }
}
