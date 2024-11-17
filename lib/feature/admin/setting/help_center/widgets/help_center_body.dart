import 'package:admin_boda/commons/common_functions/padding.dart';
import 'package:admin_boda/commons/common_imports/apis_commons.dart';
import 'package:admin_boda/commons/common_imports/common_libs.dart';
import 'package:admin_boda/commons/common_widgets/custom_button.dart';
import 'package:admin_boda/commons/common_widgets/show_dialog.dart';
import 'package:admin_boda/feature/admin/setting/help_center/dialog/add_faq_dialog.dart';
import 'package:admin_boda/feature/admin/setting/help_center/widgets/faq_list.dart';

class HelpCenterBody extends ConsumerStatefulWidget {
  const HelpCenterBody({super.key});

  @override
  ConsumerState<HelpCenterBody> createState() => _HelpCenterBodyState();
}

class _HelpCenterBodyState extends ConsumerState<HelpCenterBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'FAQs Management',
                style: getBoldStyle(
                    color: context.blackColor, fontSize: MyFonts.size22),
              ),
              CustomButton(
                onPressed: () {
                  showCustomDialog(
                      context: context, content: const AddFaqDialog());
                },
                buttonText: 'Add New',
                buttonHeight: 30,
                buttonWidth: 120,
                fontSize: 10,
              ),
            ],
          ),
          padding12,
          ListView.builder(
            itemCount: 5,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return const FAQItemWidget();
            },
          ),
        ],
      ),
    );
  }
}
