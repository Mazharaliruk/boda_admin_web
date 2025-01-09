import 'package:admin_boda/commons/common_functions/padding.dart';
import 'package:admin_boda/commons/common_imports/apis_commons.dart';
import 'package:admin_boda/commons/common_imports/common_libs.dart';
import 'package:admin_boda/commons/common_widgets/category_card.dart';
import 'package:admin_boda/commons/common_widgets/custom_button.dart';
import 'package:admin_boda/commons/common_widgets/show_dialog.dart';
import 'package:admin_boda/feature/admin/activities/category_management/dialog/add_category_dialog.dart';
import '../../../../../models/inventry/categories_model.dart';
import '../../../../../utils/loading.dart';
import '../controller/category_management_controller.dart';

class CategoryBody extends ConsumerStatefulWidget {
  const CategoryBody({super.key});

  @override
  ConsumerState<CategoryBody> createState() => _CategoryBodyState();
}

class _CategoryBodyState extends ConsumerState<CategoryBody> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final categoryController = ref.watch(categoryManagementProvider);



    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButton(
              onPressed: () {
                showCustomDialog(
                    context: context, content: const AddCategoryDialog());
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
            child: StreamBuilder<List<CategoriesModel>>(
                stream: categoryController.listenForCategoryUpdates(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                     return const LoadingWidget();
                  } else if (snapshot.hasError) {
                    return Center(child: Text(snapshot.error.toString()));
                  } else if (!snapshot.hasData) {
                    return const Center(child: Text("No Data"));
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
                        return CategoryCard(index: index, isCategory: true, categoriesModel: snapshot.data![index],);
                      });
                }),
          ),
        ),
        padding30,
      ],
    );
  }
}
