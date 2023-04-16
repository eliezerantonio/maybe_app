import 'package:dio/dio.dart';
import 'package:maybe_app/domain/entities/message_entity.dart';
import 'package:maybe_app/infrastructure/models/yes_no_model.dart';

class GetYesNoAnswer {
  final Dio _dio = Dio();
  Future<MessageEntity> getAnswer() async {
    final response = await _dio.get('https://yesno.wtf/api');

    final yesNoModel = YesNoModel.fromJson(response.data);

    return MessageEntity(
        text: yesNoModel.answer,
        fromWho: FromWho.hers,
        imageUrl: yesNoModel.image);
  }
}
