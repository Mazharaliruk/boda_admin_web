import 'package:admin_boda/commons/common_functions/padding.dart';
import 'package:admin_boda/commons/common_imports/apis_commons.dart';
import 'package:admin_boda/commons/common_imports/common_libs.dart';
import 'package:admin_boda/commons/common_widgets/custom_text_fields.dart';
import 'package:admin_boda/commons/common_widgets/show_dialog.dart';
import 'package:admin_boda/feature/admin/activities/event_management/dialog/event_filter_dialog.dart';
import 'package:admin_boda/feature/admin/activities/event_management/widgets/event_card.dart';
import 'package:admin_boda/utils/constants/assets_manager.dart';
import 'package:admin_boda/utils/loading.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../models/core/event_model.dart';
import '../controllers/event_controller.dart';

class EventBody extends ConsumerStatefulWidget {
  const EventBody({super.key});

  @override
  ConsumerState<EventBody> createState() => _EventBody();
}

class _EventBody extends ConsumerState<EventBody> {
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final eventContoller = ref.watch(eventProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
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
            InkWell(
              overlayColor: MaterialStateProperty.all(Colors.transparent),
              onTap: () {
                showCustomDialog(
                    context: context, content: const EventFilterDialog());
              },
              child: Container(
                width: 48,
                height: 48,
                margin: const EdgeInsets.only(top: 32),
                decoration: BoxDecoration(
                    color: context.whiteColor,
                    borderRadius: BorderRadius.circular(14.r)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(AppAssets.filterSvgIcon,
                      height: 24, width: 24),
                ),
              ),
            ),
          ],
        ),
        padding12,
        Expanded(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: context.whiteColor,
                borderRadius: BorderRadius.circular(14.r)),
            child: FutureBuilder<List<EventModel>>(
              future: eventContoller.fetchAllEvents(),
              builder: (context, snapshot) {
                 if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: LoadingWidget());
                } else if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                } else if (!snapshot.hasData) {
                  return const Center(child: Text("No data found"));
                }
                return GridView.builder(
                  itemCount: snapshot.data!.length,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 270,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20),
                    itemBuilder: (context, index) {
                      return  EventCard(
                        eventModel: snapshot.data![index],
                      );
                    });
              }
            ),
          ),
        ),
        padding30,
      ],
    );
  }
}
