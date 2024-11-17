import 'package:admin_boda/commons/common_functions/padding.dart';
import 'package:admin_boda/commons/common_imports/common_libs.dart';
import 'package:admin_boda/utils/constants/assets_manager.dart';
import 'package:admin_boda/utils/loading.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.buttonText,
    this.isLoading = false,
    this.backColor,
    this.textColor,
    this.buttonWidth,
    this.buttonHeight,
    this.fontSize,
    this.padding,
    this.borderRadius,
    this.borderColor,
    this.isIcon = false,
  });

  final Function()? onPressed;
  final String buttonText;
  final bool isLoading;
  final Color? backColor;
  final Color? textColor;
  final double? buttonWidth;
  final double? buttonHeight;
  final double? fontSize;
  final double? padding;
  final double? borderRadius;
  final Color? borderColor;
  final bool? isIcon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
            gradient: backColor != null ? null : context.buttonGradient,
            color: backColor ?? context.whiteColor,
            borderRadius: BorderRadius.circular(borderRadius ?? 10.r),
            border: Border.all(color: borderColor ?? context.buttonColor)),
        key: const Key('customButton'),
        height: buttonHeight ?? 45.h,
        margin: EdgeInsets.symmetric(vertical: padding ?? 10.h),
        child: SizedBox(
          // padding: EdgeInsets.symmetric(vertical: 10.h),
          width: buttonWidth ?? double.infinity,
          height: buttonHeight ?? 45.h,
          child: Center(
              child: isLoading
                  ? LoadingWidget(color: context.buttonColor)
                  : isIcon == true
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              buttonText,
                              style: getSemiBoldStyle(
                                  color: textColor ?? context.buttonColor,
                                  fontSize: fontSize ?? MyFonts.size14),
                            ),
                            padding8,
                            SvgPicture.asset(AppAssets.arrowFarSvgIcon,
                                width: 24.w, height: 24.h),
                          ],
                        )
                      : Text(
                          buttonText,
                          style: getSemiBoldStyle(
                              color: textColor ?? context.buttonColor,
                              fontSize: fontSize ?? MyFonts.size14),
                        )),
        ),
      ),
    );
  }
}
