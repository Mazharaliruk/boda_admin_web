import 'package:admin_boda/commons/common_functions/padding.dart';
import 'package:admin_boda/commons/common_imports/common_libs.dart';
import 'package:admin_boda/commons/common_widgets/custom_button.dart';
import 'package:admin_boda/utils/constants/app_constants.dart';
import 'package:admin_boda/utils/constants/assets_manager.dart';
import 'package:get/get.dart';

import '../chat/ai_chat.dart';

class VAiChatWidget extends StatelessWidget {
  const VAiChatWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppConstants.padding),
      height: 210.h,
      width: 1.sw,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: context.primary.withOpacity(0.4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'How Can i Help you?',
                    style: getRegularStyle(
                        color: context.blackColor, fontSize: MyFonts.size13),
                  ),
                  padding6,
                  Text(
                    "Hi There, I am Boda AI,i’m Here To Assist You! ",
                    style: getRegularStyle(
                        color: context.blackColor, fontSize: MyFonts.size24),
                  ),
                  CustomButton(
                    onPressed: () {
                   Navigator.of(context).push(
                     MaterialPageRoute(
                       builder: (context) => const ChatScreen(),
                     ),
                   );
                    },
                    buttonText: 'Chat With Ai',
                    buttonHeight: 46.h,
                    buttonWidth: 118.w,
                    borderRadius: 10.r,
                    backColor: context.primary,
                  )
                ],
              ),
              CircleAvatar(
                radius: 33.r,
                backgroundColor: context.blackColor,
                child: Image.asset(
                  AppAssets.bodaLogo,
                  height: 24.h,
                  width: 38.w,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
