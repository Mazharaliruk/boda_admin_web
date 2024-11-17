import 'package:admin_boda/commons/common_functions/padding.dart';
import 'package:admin_boda/commons/common_imports/apis_commons.dart';
import 'package:admin_boda/commons/common_imports/common_libs.dart';
import 'package:admin_boda/commons/common_widgets/custom_text_fields.dart';
import 'package:admin_boda/feature/admin/people/users/widgets/user_card.dart';
import 'package:admin_boda/utils/constants/assets_manager.dart';

class UserBody extends ConsumerStatefulWidget {
  const UserBody({super.key});

  @override
  ConsumerState<UserBody> createState() => _PaymentBodyState();
}

class _PaymentBodyState extends ConsumerState<UserBody> {
  final searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 412.w,
          child: CustomTextField(
            controller: searchController,
            hintText: 'Search',
            showLabel: false,
            label: '',
            leadigingIconPath: AppAssets.searchSvgIcon,
          ),
        ),
        padding12,
        Expanded(
          child: ListView.builder(
              itemCount: 20,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.only(top: 0, bottom: 100),
              itemBuilder: (context, index) {
                return const UserCard();
              }),
        )
      ],
    );
  }
}
