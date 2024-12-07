import 'package:admin_boda/commons/common_functions/padding.dart';
import 'package:admin_boda/commons/common_imports/apis_commons.dart';
import 'package:admin_boda/commons/common_imports/common_libs.dart';
import 'package:admin_boda/commons/common_widgets/category_card.dart';
import 'package:admin_boda/commons/common_widgets/custom_button.dart';
import 'package:admin_boda/commons/common_widgets/show_dialog.dart';
import 'package:admin_boda/feature/admin/activities/sub_category_management/dialog/add_sub_cat_dialog.dart';
import 'package:admin_boda/utils/loading.dart';

import '../../../../../models/inventry/sub_category_model.dart';
import '../controller/sub_category_controller.dart';

class SubCategoryBody extends ConsumerStatefulWidget {
  const SubCategoryBody({super.key});

  @override
  ConsumerState<SubCategoryBody> createState() => _SubCategoryBody();
}

class _SubCategoryBody extends ConsumerState<SubCategoryBody> {
  @override
  Widget build(BuildContext context) {
    final subCategoryController = ref.watch(subCategoryManagementProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButton(
              onPressed: () {
                showCustomDialog(
                    context: context, content: const AddSubCategoryDialog());
              },
              buttonText: 'Add Category',
              buttonHeight: 35,
              buttonWidth: 150,
              backColor: context.primary,
              borderRadius: 8,
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
            child: FutureBuilder<List<SubCategoryModel>>(
                future: subCategoryController.fetchSubCategories(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const LoadingWidget();
                  } else if (snapshot.hasError) {
                    return Center(child: Text(snapshot.error.toString()));
                  } else if (!snapshot.hasData) {
                    return const Center(
                        child: Text("Sub Categories not found"));
                  }
                  return GridView.builder(
                      itemCount: snapshot.data!.length,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 20),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              mainAxisExtent: 150,
                              mainAxisSpacing: 20,
                              crossAxisSpacing: 20),
                      itemBuilder: (context, index) {
                        return CategoryCard(
                            index: index,
                            isCategory: false,
                            subCategoriesModel: snapshot.data![index]);
                      });
                }),
          ),
        ),
        padding30,
      ],
    );
  }
}
