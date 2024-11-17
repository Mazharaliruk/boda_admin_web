import 'package:admin_boda/commons/common_functions/padding.dart';
import 'package:admin_boda/commons/common_imports/common_libs.dart';
import 'package:admin_boda/feature/admin/messages/widgets/chat_input_field.dart';
import 'package:admin_boda/utils/constants/assets_manager.dart';

class Chat extends StatelessWidget {
  const Chat({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1010,
      decoration: BoxDecoration(
          border: Border.symmetric(
              vertical: BorderSide(color: context.lightGreyColor))),
      child: Column(
        children: [
          Container(
            height: 100.h,
            width: 1010,
            decoration: BoxDecoration(
                border: Border.symmetric(
                    horizontal: BorderSide(color: context.lightGreyColor))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    padding24,
                    ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          AppAssets.msgImgImage,
                          height: 48,
                          width: 48,
                          fit: BoxFit.cover,
                        )),
                    padding12,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Elmer Laverty',
                          style: getSemiBoldStyle(
                              color: context.blackColor,
                              fontSize: MyFonts.size14),
                        ),
                        Row(
                          children: [
                            const CircleAvatar(
                              radius: 5,
                              backgroundColor: MyColors.green,
                            ),
                            padding6,
                            Text(
                              'Online',
                              style: getSemiBoldStyle(
                                  color: context.darkGreyColor,
                                  fontSize: MyFonts.size12),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container();
                }),
          ),
          const ChatInputField(
            receiverUserId: 'uid',
            recieverName: 'name',
          )
        ],
      ),
    );
  }
}
