import 'package:maybe_app/domain/entities/message_entity.dart';

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

  MessageEntity toMessageEntity() => MessageEntity(
        text: answer,
        fromWho: FromWho.hers,
        imageUrl: image,
      );
}
