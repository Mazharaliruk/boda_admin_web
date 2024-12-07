import 'package:admin_boda/commons/common_imports/common_libs.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomDropdownField<T> extends StatelessWidget {
  final T? value;
  final List<T> items;
  final String hintText;
  final String label;
  final Function(T?) onChanged;
  final String? Function(T?)? validatorFn;
  final Widget? leadingIcon;
  final String? leadingIconPath;
  final Widget? tailingIcon;
  final String? tailingIconPath;
  final double? borderRadius;
  final double? verticalPadding;
  final double? verticalMargin;
  final Color? fillColor;
  final bool showLabel;
  final bool showReq;
  final bool? enabled;
  final Widget Function(T)? itemBuilder;

  const CustomDropdownField({
    super.key,
    required this.value,
    required this.items,
    required this.hintText,
    required this.label,
    required this.onChanged,
    this.validatorFn,
    this.leadingIcon,
    this.leadingIconPath,
    this.tailingIcon,
    this.tailingIconPath,
    this.borderRadius,
    this.verticalPadding,
    this.verticalMargin,
    this.fillColor,
    this.showLabel = true,
    this.showReq = true,
    this.enabled = true,
    this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: verticalMargin ?? 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20.0.w, bottom: 5.h),
            child: Row(
              children: [
                Text(
                  label,
                  style: getSemiBoldStyle(
                      fontSize: MyFonts.size13, color: context.darkGreyColor),
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
          ),
          DropdownButtonFormField<T>(
            value: value,
            items: items.map((T item) {
              return DropdownMenuItem<T>(
                value: item,
                child: itemBuilder?.call(item) ?? Text(item.toString()),
              );
            }).toList(),
            onChanged: enabled! ? onChanged : null,
            validator: validatorFn,
            decoration: InputDecoration(
              fillColor: fillColor ?? context.containerColor,
              filled: true,
              contentPadding: EdgeInsets.symmetric(
                  horizontal: 20.w, vertical: verticalPadding ?? 0.0),
              errorStyle: getRegularStyle(
                  fontSize: MyFonts.size10,
                  color: Theme.of(context).colorScheme.error),
           
              prefixIcon: leadingIconPath != null
                  ? Padding(
                      padding: EdgeInsets.all(13.0.h),
                      child: SvgPicture.asset(
                        leadingIconPath!,
                      ),
                    )
                  : leadingIcon,
              hintText: hintText,
              hintStyle: getRegularStyle(
                  fontSize: MyFonts.size12, color: context.bodyTextColor),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 14.r),
                borderSide:
                    BorderSide(color: context.lightGreyColor, width: 0.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 14.r),
                borderSide:
                    BorderSide(color: context.lightGreyColor, width: 0.0),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 14.r),
                borderSide:
                    BorderSide(color: context.lightGreyColor, width: 0.0),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 14.r),
                borderSide:
                    BorderSide(color: context.lightGreyColor, width: 0.0),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 14.r),
                borderSide:
                    BorderSide(color: context.lightGreyColor, width: 0.0),
              ),
            ),
            style: getRegularStyle(
                fontSize: MyFonts.size12,
                color: fillColor != null
                    ? context.darkGreyColor
                    : context.whiteColor),
          ),
        ],
      ),
    );
  }
}