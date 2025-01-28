import 'dart:io';

import 'package:admin_boda/commons/common_imports/apis_commons.dart';
import 'package:admin_boda/commons/common_imports/common_libs.dart';
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:openai_dart/openai_dart.dart';

final aiProvider = ChangeNotifierProvider((ref) => AiController());



class AiController extends ChangeNotifier {
  // final openAI = OpenAI.instance.build(
  //     token: token,
  //     baseOption: HttpSetup(receiveTimeout: const Duration(seconds: 5)),
  //     enableLog: true);


  // void chatComplete() async {
  //   final request = ChatCompleteText(messages: [
  //     Map.of({"role": "user", "content": 'Hello!'})
  //   ], maxToken: 200, model: Gpt41106PreviewChatModel());

  //   final response = await openAI.onChatCompletion(request: request);
  //   for (var element in response!.choices) {
  //     print("data -> ${element.message?.content}");
  //   }
  // }


}
