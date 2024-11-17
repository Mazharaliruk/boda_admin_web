import 'package:admin_boda/commons/common_functions/formated_date.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
import '../../../../commons/common_functions/padding.dart';
import '../../../../commons/common_imports/common_libs.dart';
import '../../../../utils/responsive/responsive.dart';

class BarGraphChart extends StatelessWidget {
  final List<int> visitors;

  const BarGraphChart({super.key, required this.visitors});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              visitors.fold(0, (sum, count) => sum + count).toString(),
              style: getExtraBoldStyle(
                  color: context.whiteColor, fontSize: MyFonts.size20),
            ),
            padding12,
            // RotatedBox(
            //     quarterTurns: 1,
            //     child: SvgPicture.asset(
            //       AppAssets.downSvgIcon,
            //       height: 12.h,
            //       width: 12.w,
            //     )),
          ],
        ),
        Text(
          'Number of visitor',
          style: getMediumStyle(
              color: context.lightTextColor, fontSize: MyFonts.size14),
        ),
        padding12,
        Expanded(
          child: BarChart(
            BarChartData(
              barGroups: _chartGroups(
                visitorCounts: visitors,
                color: MyColors.primaryColor,
              ),
              borderData: FlBorderData(border: const Border()),
              gridData: const FlGridData(show: false),
              titlesData: FlTitlesData(
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    reservedSize: 50,
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      final dates = _buildPreviousDays(visitors.length - 1);
                      final months = getPreviousMonths();
                      final index = int.parse(meta.formattedValue);
                      return Container(
                        constraints: BoxConstraints(
                          maxHeight: 50,
                          maxWidth: Responsive.isMobile(context) ? 50 : 65,
                        ),
                        padding: const EdgeInsets.only(top: 0),
                        child: Text(
                          visitors.length > 13
                              ? formatDateOnly(dates[index])
                              : visitors.length < 8
                              ?  formatPublishedDate(dates[index])
                              : months[index],
                          textAlign: TextAlign.center,
                          style: getMediumStyle(
                            fontSize: MyFonts.size11,
                            color: context.lightTextColor,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                leftTitles: AxisTitles(
                  axisNameSize: 30,
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 15,
                    getTitlesWidget: (value, meta) {
                      return Container(
                        constraints: BoxConstraints(
                          maxHeight: 50,
                          maxWidth: Responsive.isMobile(context) ? 50 : 65,
                        ),
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          value % 1 == 0 ? value.toInt().toString() : '',
                          textAlign: TextAlign.center,
                          style: getMediumStyle(
                            fontSize: MyFonts.size11,
                            color: context.lightTextColor,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                topTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                rightTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  List<BarChartGroupData> _chartGroups({
    required List<int> visitorCounts,
    required Color color,
  }) {
    return visitorCounts.asMap().entries.map((entry) {
      int index = entry.key;
      int count = entry.value;

      return BarChartGroupData(
          x: index.toInt(),
          barRods: [
            BarChartRodData(
              toY: count.toDouble(),
              width: visitors.length > 13
                  ? 10
                  : visitors.length < 8
                  ? 60
                  : 20,
              color: color.withOpacity(count.toInt() > 4 ? 1 : 0.4),
              borderRadius: BorderRadius.circular(10),
            ),
          ],
          showingTooltipIndicators: null);
    }).toList();
  }

  List<DateTime> _buildPreviousDays(days) {
    // List<String> dates = [];
    List<DateTime> dates = [];
    DateTime today = DateTime.now();
    for (int i = days; i >= 0; i--) {
      DateTime previousDate = today.subtract(Duration(days: i));
      dates.add(previousDate);
    }
    return dates;
  }

  List<String> getPreviousMonths() {
    List<String> months = [];
    DateTime now = DateTime.now();
    DateFormat formatter = DateFormat.MMM();
    for (int i = 11; i >= 0; i--) {
      DateTime previousMonth = DateTime(now.year, now.month - i, 1);
      months.add(formatter.format(previousMonth));
    }
    return months;
  }
}