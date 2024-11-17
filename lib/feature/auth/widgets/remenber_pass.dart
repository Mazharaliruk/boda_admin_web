import 'package:admin_boda/commons/common_functions/padding.dart';
import 'package:admin_boda/commons/common_imports/common_libs.dart';

class RememberPassword extends StatefulWidget {
  const RememberPassword({super.key});

  @override
  State<RememberPassword> createState() => _RememberPasswordState();
}

class _RememberPasswordState extends State<RememberPassword> {
  bool isCheck = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              isCheck = !isCheck;
            });
          },
          child: Container(
            height: 24.h,
            width: 24.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2.r),
                border: Border.all(color: context.secondary, width: 1.5)),
            child: Icon(
              Icons.check,
              color: isCheck ? context.secondary : MyColors.transparentColor,
              size: 20.r,
            ),
          ),
        ),
        padding12,
        Text(
          'Remember me',
          style: getRegularStyle(
              color: context.darkGreyColor, fontSize: MyFonts.size16),
        )
      ],
    );
  }
}
