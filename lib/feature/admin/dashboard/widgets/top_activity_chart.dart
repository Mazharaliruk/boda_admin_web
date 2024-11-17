import 'package:admin_boda/commons/common_functions/padding.dart';
import 'package:admin_boda/commons/common_imports/common_libs.dart';
import 'package:fl_chart/fl_chart.dart';

class TopActivityChart extends StatefulWidget {
  const TopActivityChart({super.key});

  @override
  State<TopActivityChart> createState() => _TopActivityChartState();
}

class _TopActivityChartState extends State<TopActivityChart> {
  double count = 0.0;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Top 3 Activies',
          style: getMediumStyle(
              color: context.blackColor, fontSize: MyFonts.size17),
        ),
        Row(
          children: [
            SizedBox(
              height: 110,
              width: 110,
              child: PieChart(
                PieChartData(
                    sectionsSpace: 0,
                    centerSpaceRadius: 30,
                    startDegreeOffset: -90,
                    sections: [
                      PieChartSectionData(
                          color: context.errorColor,
                          value: 50,
                          showTitle: false,
                          radius: 10),
                      PieChartSectionData(
                          color: context.secondary,
                          value: 35,
                          showTitle: false,
                          radius: 10),
                      PieChartSectionData(
                          color: context.greyColor,
                          value: 15,
                          showTitle: false,
                          radius: 10),
                    ]),
              ),
            ),
            padding32,
            Column(
              children: [
                chipCard(title: 'Abc', value: '50%'),
                padding12,
                chipCard(title: 'Def', value: '35%'),
                padding12,
                chipCard(title: 'Ghi', value: '15%'),
              ],
            )
          ],
        ),
      ],
    );
  }

  chipCard({required String title, required String value}) {
    return SizedBox(
      width: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: getLightStyle(
                color: context.blackColor, fontSize: MyFonts.size12),
          ),
          Text(
            value,
            style: getMediumStyle(
                color: context.blackColor, fontSize: MyFonts.size20),
          ),
        ],
      ),
    );
  }
}
