import 'package:admin_boda/commons/common_functions/padding.dart';
import 'package:admin_boda/commons/common_imports/common_libs.dart';
import 'package:admin_boda/feature/admin/dashboard/widgets/profit_chart.dart';
import 'package:admin_boda/feature/admin/dashboard/widgets/top_activity.dart';

class BookingAndProfit extends StatelessWidget {
  const BookingAndProfit({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Booking and Profit',
          style: getMediumStyle(
              color: context.blackColor, fontSize: MyFonts.size17),
        ),
        Text(
          'Overview of your booking and profit',
          style: getLightStyle(
              color: context.blackColor, fontSize: MyFonts.size14),
        ),
        padding12,
        const TopActivity(),
        padding12,
        const ProfitChart(),
      ],
    );
  }
}
