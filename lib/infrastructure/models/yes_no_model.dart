class YesNoModel {
  late String answer;
  late bool forced;
  late String image;

  YesNoModel({required this.answer, required this.forced, required this.image});

  YesNoModel.fromJson(Map<String, dynamic> json) {
    answer = json['answer'];
    forced = json['forced'];
    image = json['image'];
  }
}
