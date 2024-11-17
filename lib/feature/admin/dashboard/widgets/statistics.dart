import 'package:admin_boda/commons/common_functions/padding.dart';
import 'package:admin_boda/commons/common_imports/common_libs.dart';
import 'package:admin_boda/feature/admin/dashboard/widgets/book_ticket_chart.dart';
import 'package:admin_boda/feature/admin/dashboard/widgets/total_sale_chart.dart';
import 'package:admin_boda/feature/admin/dashboard/widgets/vendor_payment_chart.dart';

class Statistics extends StatelessWidget {
  const Statistics({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Statistics',
                style: getMediumStyle(
                    color: context.blackColor, fontSize: MyFonts.size17),
              ),
              Text(
                'This month',
                style: getMediumStyle(
                    color: context.blackColor, fontSize: MyFonts.size14),
              ),
            ],
          ),
          padding12,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const BookTicketChart(),
              Column(
                children: [
                  const TotalSaleChart(),
                  padding12,
                  const VendorPaymentChart()
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
