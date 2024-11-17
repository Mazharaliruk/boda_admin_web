import 'package:admin_boda/commons/common_imports/common_libs.dart';

class NoDataWidget extends StatelessWidget {
  final String textToShow;

  const NoDataWidget({super.key, required this.textToShow});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(textToShow,
              style: getMediumStyle(
                  fontSize: MyFonts.size16, color: context.whiteColor)),
        ),
      ],
    );
  }
}
