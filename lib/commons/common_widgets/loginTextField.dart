import 'package:admin_boda/commons/common_imports/common_libs.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final TextInputType? inputType;
  final bool obscure;
  final IconData? icon;
  final String? Function(String?)? validatorFn;
  final Widget? leadingIcon;
  final Widget? tailingIcon;
  final String? tailingIconPath;
  final String? leadigingIconPath;
  final double? texFieldHeight;
  final double? borderRadius;
  final double? verticalPadding;
  final double? verticalMargin;
  final Color? fillColor;
  final int? maxLines;
  final bool showLabel;
  final bool showReq;
  final String? label;
  final bool? enabled;
  final int? maxLength;
  final VoidCallback? onTap;

  const LoginTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.onChanged,
    this.onFieldSubmitted,
    this.inputType,
    this.leadingIcon,
    this.obscure = false,
    this.validatorFn,
    this.icon,
    this.tailingIcon,
    this.texFieldHeight,
    this.showLabel = true,
    this.tailingIconPath,
    this.fillColor,
    this.maxLines,
    this.borderRadius,
    this.verticalPadding,
    this.verticalMargin,
    this.showReq = true,
    this.leadigingIconPath,
    this.label,
    this.enabled = true,
    this.maxLength,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: verticalMargin ?? 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          label != null
              ? Padding(
                  padding: EdgeInsets.only(left: 20.0.w, bottom: 5.h),
                  child: Row(
                    children: [
                      Text(
                        label!,
                        style: getSemiBoldStyle(
                            fontSize: MyFonts.size13,
                            color: context.lightTextColor),
                      ),
                      Text(
                        label == ''
                            ? ''
                            : showReq
                                ? '*'
                                : '',
                        style: getSemiBoldStyle(
                            fontSize: MyFonts.size18,
                            color: Theme.of(context).colorScheme.error),
                      ),
                    ],
                  ),
                )
              : Container(),
          InkWell(
            onTap: onTap,
            child: TextFormField(
              maxLength: maxLength,
              enabled: enabled,
              validator: validatorFn,
              obscureText: obscure,
              controller: controller,
              keyboardType: inputType,
              maxLines: maxLines ?? 1,
              style: getRegularStyle(
                  fontSize: MyFonts.size14,
                  color: fillColor != null
                      ? context.bodyTextColor
                      : context.whiteColor),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                    horizontal: 20.w, vertical: verticalPadding ?? 0.0),
                errorStyle: getRegularStyle(
                    fontSize: MyFonts.size10,
                    color: Theme.of(context).colorScheme.error),
                suffixIcon: tailingIconPath != null
                    ? Padding(
                        padding: EdgeInsets.all(15.0.h),
                        child: SvgPicture.asset(tailingIconPath!,
                            colorFilter: ColorFilter.mode(
                                context.lightTextColor, BlendMode.srcIn)),
                      )
                    : tailingIcon,
                prefixIcon: leadigingIconPath != null
                    ? Padding(
                        padding: EdgeInsets.all(13.0.h),
                        child: SvgPicture.asset(
                          leadigingIconPath!,
                        ),
                      )
                    : leadingIcon,
                hintText: hintText,
                hintStyle: getRegularStyle(
                    fontSize: MyFonts.size14, color: context.bodyTextColor),
              ),
              onFieldSubmitted: onFieldSubmitted,
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}
