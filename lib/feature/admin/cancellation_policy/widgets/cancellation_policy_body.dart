import 'package:admin_boda/commons/common_functions/padding.dart';
import 'package:admin_boda/commons/common_imports/apis_commons.dart';
import 'package:admin_boda/commons/common_imports/common_libs.dart';
import 'package:admin_boda/commons/common_widgets/custom_button.dart';
import 'package:admin_boda/commons/common_widgets/show_dialog.dart';
import 'package:admin_boda/feature/admin/cancellation_policy/dialog/add_policy_dialog.dart';
import 'package:admin_boda/feature/admin/cancellation_policy/widgets/policy_card.dart';

class CancellationPolicyBody extends ConsumerStatefulWidget {
  const CancellationPolicyBody({super.key});

  @override
  ConsumerState<CancellationPolicyBody> createState() =>
      _CancellationPolicyBodyState();
}

class _CancellationPolicyBodyState
    extends ConsumerState<CancellationPolicyBody> {
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
                'Cancellation Policies',
                style: getBoldStyle(
                    color: context.blackColor, fontSize: MyFonts.size22),
              ),
              CustomButton(
                onPressed: () {
                  showCustomDialog(
                      context: context, content: const AddPolicyDialog());
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
            itemCount: 3,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return const PolicyCard();
            },
          ),
        ],
      ),
    );
  }
}
