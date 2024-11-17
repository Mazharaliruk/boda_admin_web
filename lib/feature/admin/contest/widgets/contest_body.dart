import 'package:admin_boda/commons/common_functions/padding.dart';
import 'package:admin_boda/commons/common_imports/apis_commons.dart';
import 'package:admin_boda/commons/common_imports/common_libs.dart';
import 'package:admin_boda/commons/common_widgets/custom_button.dart';
import 'package:admin_boda/commons/common_widgets/show_dialog.dart';
import 'package:admin_boda/feature/admin/contest/dialog/add_contest_dialog.dart';
import 'package:admin_boda/feature/admin/contest/widgets/contest_card.dart';

class ContestBody extends ConsumerStatefulWidget {
  const ContestBody({super.key});

  @override
  ConsumerState<ContestBody> createState() => _ContestBodyState();
}

class _ContestBodyState extends ConsumerState<ContestBody> {
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
                'Contest',
                style: getBoldStyle(
                    color: context.blackColor, fontSize: MyFonts.size22),
              ),
              CustomButton(
                onPressed: () {
                  showCustomDialog(
                      context: context, content: const AddContestDialog());
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
            itemCount: 1,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return const ContestCard();
            },
          ),
        ],
      ),
    );
  }
}
