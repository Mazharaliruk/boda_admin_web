import 'package:admin_boda/commons/common_functions/padding.dart';
import 'package:admin_boda/commons/common_imports/apis_commons.dart';
import 'package:admin_boda/commons/common_imports/common_libs.dart';
import 'package:admin_boda/commons/common_widgets/custom_text_fields.dart';
import 'package:admin_boda/feature/admin/people/vendors/widgets/vendor_card.dart';
import 'package:admin_boda/utils/constants/assets_manager.dart';

import '../../../../../models/account/vendor_profile_model.dart';
import '../controllers/vendor_controller.dart';

class VendorsBody extends ConsumerStatefulWidget {
  const VendorsBody({super.key});

  @override
  ConsumerState<VendorsBody> createState() => _PaymentBodyState();
}

class _PaymentBodyState extends ConsumerState<VendorsBody> {
  final searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
     final vendorCtr = ref.watch(vendorController);
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
          child: FutureBuilder<List<VendorProfileModel>>(
            future: vendorCtr.fetchVendorList(),
            builder: (context, snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator(),);
              }else if(snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()),);
              }else if(!snapshot.hasData) {
                return const Center(child: Text('No data found'),);
              }
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.only(top: 0, bottom: 100),
                  itemBuilder: (context, index) {
                    return  VendorCard( vendorProfileModel: snapshot.data![index],
                    vendorCtr: vendorCtr,
                    );
                  });
            }
          ),
        )
      ],
    );
  }
}
