import 'package:admin_boda/commons/common_functions/padding.dart';
import 'package:admin_boda/commons/common_imports/common_libs.dart';
import 'package:admin_boda/feature/admin/ai/widgets/sector.dart';
import 'package:fl_chart/fl_chart.dart';

class VAnalysisPieChartWidget extends StatefulWidget {
  const VAnalysisPieChartWidget({super.key});

  @override
  State<VAnalysisPieChartWidget> createState() =>
      _VAnalysisPieChartWidgetState();
}

class _VAnalysisPieChartWidgetState extends State<VAnalysisPieChartWidget> {
  final List<Sector> sectors = [
    Sector(MyColors.secondaryColor, 50),
    Sector(MyColors.red, 16),
    Sector(MyColors.platinum, 26),
  ];

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 1.0,
        child: Stack(
          children: [
            PieChart(PieChartData(
              sections: _chartSections(sectors),
              centerSpaceRadius: 48.0,
            )),
            Positioned(
              top: 50,
              left: 45,
              child: Column(
                children: [
                  Text(
                    '+14%',
                    style: getRegularStyle(
                        color: MyColors.platinum,
                        fontSize: MyFonts.size24),
                  ),
                  padding4,
                  Text(
                    'vs last month',
                    style: getRegularStyle(
                        color: context.blackColor, fontSize: MyFonts.size10),
                  ),
                  padding4,
                  Text(
                    'Great results with',
                    style: getRegularStyle(
                        color: context.blackColor, fontSize: MyFonts.size10),
                  )
                ],
              ),
            ),
          ],
        ));
  }

  List<PieChartSectionData> _chartSections(List<Sector> sectors) {
    final List<PieChartSectionData> list = [];
    for (var sector in sectors) {
      const double radius = 6;
      final data = PieChartSectionData(
        color: sector.color,
        value: sector.value,
        radius: radius,
        title: '',
      );
      list.add(data);
    }
    return list;
  }
}
