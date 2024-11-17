import 'package:admin_boda/commons/common_functions/padding.dart';
import 'package:admin_boda/commons/common_imports/apis_commons.dart';
import 'package:admin_boda/commons/common_imports/common_libs.dart';
import 'package:admin_boda/commons/common_widgets/custom_button.dart';
import 'package:admin_boda/commons/common_widgets/custom_text_fields.dart';
import 'package:admin_boda/feature/admin/setting/send_notification/dialog/send_to_popup.dart';
import 'package:admin_boda/utils/constants/assets_manager.dart';
import 'package:flutter_popup/flutter_popup.dart';

class SendNotificationBody extends ConsumerStatefulWidget {
  const SendNotificationBody({super.key});

  @override
  ConsumerState<SendNotificationBody> createState() =>
      _SendNotificationBodyState();
}

class _SendNotificationBodyState extends ConsumerState<SendNotificationBody> {
  final titleCtr = TextEditingController();
  final descriptionCtr = TextEditingController();
  final sendToCtr = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Send Notification',
            style: getBoldStyle(
                color: context.blackColor, fontSize: MyFonts.size22),
          ),
          padding20,
          CustomTextField(
            fillColor: context.whiteColor,
            verticalPadding: 10,
            controller: titleCtr,
            hintText: 'Enter Title',
            label: 'Title',
          ),
          CustomPopup(
            barrierColor: context.primary.withOpacity(0.1),
            backgroundColor: Colors.white,
            content: SendToPopup(onPress: () {}),
            child: CustomTextField(
              enabled: false,
              fillColor: context.whiteColor,
              verticalPadding: 10,
              controller: sendToCtr,
              hintText: 'Select Event For Coin Earning',
              label: 'Coin Earning Event',
              tailingIconPath: AppAssets.dropDownSvgIcon,
            ),
          ),
          CustomTextField(
            fillColor: context.whiteColor,
            verticalPadding: 15,
            controller: titleCtr,
            hintText: 'Enter Some Description',
            label: 'Description',
            maxLines: 5,
          ),
          padding30,
          Center(
            child: CustomButton(
              onPressed: () {},
              buttonText: 'Send Notification',
              buttonHeight: 60,
              buttonWidth: 400,
            ),
          )
        ],
      ),
    );
  }
}
