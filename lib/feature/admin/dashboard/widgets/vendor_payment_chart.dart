import 'package:admin_boda/commons/common_imports/common_libs.dart';
import 'package:admin_boda/utils/constants/assets_manager.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VendorPaymentChart extends StatelessWidget {
  const VendorPaymentChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: 395,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: context.whiteColor,
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: LineChart(LineChartData(
              gridData: const FlGridData(
                show: false,
              ),
              titlesData: const FlTitlesData(
                  show: false,
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: false,
                    ),
                  )),
              borderData: FlBorderData(
                show: false,
              ),
              minX: 0,
              maxX: 20,
              minY: 0,
              maxY: 6,
              lineBarsData: [
                LineChartBarData(
                  color: context.primary.withOpacity(0.3),
                  spots: const [
                    FlSpot(0, 1),
                    FlSpot(4, 2),
                    FlSpot(9, 2),
                    FlSpot(10, 2.5),
                    FlSpot(13, 3),
                    FlSpot(15, 3.3),
                    FlSpot(20, 4),
                  ],
                  isCurved: true,
                  barWidth: 2,
                  isStrokeCapRound: false,
                  gradient: context.buttonGradient,
                  dotData: const FlDotData(show: false),
                  belowBarData: BarAreaData(
                    color: context.primary.withOpacity(0.1),
                    show: true,
                  ),
                ),
              ],
            )),
          ),
          Positioned(
            top: 26,
            left: 26,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total Vender Payment',
                  style: getMediumStyle(
                      color: context.blackColor, fontSize: MyFonts.size16),
                ),
                Row(
                  children: [
                    Text(
                      '221',
                      style: getMediumStyle(
                          color: context.blackColor, fontSize: MyFonts.size40),
                    ),
                    Text(
                      '+8.5%',
                      style: getSemiBoldStyle(
                          color: context.primary, fontSize: MyFonts.size16),
                    ),
                    SvgPicture.asset(
                      AppAssets.arrowSvgIcon,
                      height: 12,
                      width: 12,
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
