import 'package:admin_boda/commons/common_imports/apis_commons.dart';
import 'package:admin_boda/commons/common_imports/common_libs.dart';
import 'package:admin_boda/feature/admin/dashboard/widgets/bar_graph_chart.dart';
import 'package:admin_boda/utils/constants/app_constants.dart';
import 'package:admin_boda/utils/responsive/responsive.dart';

class UniqeVisitorWidget extends ConsumerWidget {
  const UniqeVisitorWidget({super.key});

  @override
  Widget build(BuildContext context, ref) {
    // final barGraphData = BarGraphData();
    // final visitorCounts = [
    //   1,
    //   6,
    //   2,
    //   5,
    //   3,
    //   1,
    //   0,
    // ];
    // final monthlyVisitor = [
    //   1,
    //   6,
    //   2,
    //   5,
    //   3,
    //   1,
    //   0,
    //   1,
    //   6,
    //   2,
    //   5,
    //   3,
    //   1,
    //   0,
    //   1,
    //   6,
    //   2,
    //   5,
    //   3,
    //   1,
    //   0,
    //   1,
    //   6,
    //   2,
    //   5,
    //   3,
    //   1,
    //   0,
    //   1,
    //   6,
    //   2,
    //   5,
    //   3,
    //   1,
    //   0,
    // ];
    // final yearlyVisitor = [
    //   1,
    //   6,
    //   2,
    //   5,
    //   3,
    //   1,
    //   0,
    //   1,
    //   6,
    //   2,
    //   5,
    //   3,
    // ];
    return DefaultTabController(
      length: 3,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.r),
          color: context.whiteColor,
        ),
        margin: EdgeInsets.symmetric(horizontal: AppConstants.padding + 22),
        height: 520.h,
        child: Column(
          children: [
            TabBar(
              tabAlignment: TabAlignment.start,
              padding: EdgeInsets.zero,
              indicatorPadding: EdgeInsets.zero,
              indicatorWeight: 2,
              indicatorColor: context.primary,
              indicatorSize: TabBarIndicatorSize.tab,
              dividerColor: context.textFieldColor,
              labelColor: context.primary,
              unselectedLabelColor: context.lightTextColor,
              isScrollable: true,
              labelPadding: EdgeInsets.symmetric(
                  horizontal: Responsive.isMobile(context) ? 18 : 50),
              unselectedLabelStyle: getBoldStyle(
                  color: context.lightTextColor, fontSize: MyFonts.size18),
              labelStyle: getBoldStyle(
                  color: context.whiteColor, fontSize: MyFonts.size18),
              tabs: const [
                Tab(child: Text('Weekly')),
                Tab(child: Text('Monthly')),
                Tab(child: Text('Yearly')),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  const BarGraphChart(
                    visitors: [1, 6, 2, 5, 3, 1, 0],
                  ),
                  // ref.watch(getDaysVisitorProvider(6)).when(
                  //     data: (visitorCounts) {
                  //       bool allZeros =
                  //           visitorCounts.every((count) => count == 0);
                  //         return allZeros
                  //           ? const NoDataExist()
                  //           : BarGraphChart(
                  //               visitors: visitorCounts,
                  //             );
                  //     },
                  //     error: (e, s) =>  const NoDataExist(),
                  //     loading: () => const LoadingWidget()),
                  BarGraphChart(
                    visitors: convertToMonthlyCounts([1, 6, 2, 5, 3, 1, 0]),
                  ),
                  // ref.watch(getDaysVisitorProvider(29)).when(
                  //     data: (visitorCounts) {
                  //       bool allZeros =
                  //           visitorCounts.every((count) => count == 0);
                  //       return allZeros
                  //           ? const NoDataExist()
                  //           : BarGraphChart(
                  //               visitors: visitorCounts,
                  //             );
                  //     },
                  //     error: (e, s) => const NoDataExist(),
                  //     loading: () => const LoadingWidget()),
                  // ref.watch(getDaysVisitorProvider(359)).when(
                  //     data: (countData) {
                  //       final visitorCounts = convertToMonthlyCounts(countData);
                  //       bool allZeros =
                  //           visitorCounts.every((count) => count == 0);
                  //       return allZeros
                  //           ? const NoDataExist()
                  //           :
                  //     },
                  //     error: (e, s) => const NoDataExist(),
                  //     loading: () => const LoadingWidget()),

                  BarGraphChart(
                    visitors: convertToMonthlyCounts([1, 6, 2, 5, 3, 1, 0]),
                  ),
                ],
              ),
            ),
          ],
        ),
        // child: BarChart(
        //   BarChartData(
        //     barGroups: _chartGroups(
        //         points: barGraphData.data.graph,
        //         color: MyColors.primaryColor,
        //         context: context),
        //     borderData: FlBorderData(border: const Border()),
        //     gridData: const FlGridData(show: false),
        //     titlesData: FlTitlesData(
        //       bottomTitles: AxisTitles(
        //         sideTitles: SideTitles(
        //           reservedSize: 50,
        //           showTitles: true,
        //           getTitlesWidget: (value, meta) {
        //             return Container(
        //               constraints: BoxConstraints(
        //                   maxHeight: 50,
        //                   maxWidth: Responsive.isMobile(context) ? 50 : 65),
        //               padding: const EdgeInsets.only(top: 0),
        //               child: Text(
        //                 barGraphData.label[value.toInt()],
        //                 textAlign: TextAlign.center,
        //                 style: getMediumStyle(
        //                   fontSize: MyFonts.size11,
        //                   color: context.lightTextColor,
        //                 ),
        //               ),
        //             );
        //           },
        //         ),
        //       ),
        //       leftTitles: const AxisTitles(
        //         axisNameSize: 25,
        //         sideTitles: SideTitles(showTitles: true, reservedSize: 15),
        //       ),
        //       topTitles: const AxisTitles(
        //         sideTitles: SideTitles(showTitles: false),
        //       ),
        //       rightTitles: const AxisTitles(
        //         sideTitles: SideTitles(showTitles: false),
        //       ),
        //     ),
        //   ),
        // ),
        // ),
        // ],
        // ),
      ),
    );
  }

  List<int> convertToMonthlyCounts(List<int> dailyCounts) {
    List<int> newList = [];
    for (int i = 0; i < dailyCounts.length; i += 30) {
      int sum = dailyCounts.skip(i).take(30).reduce((a, b) => a + b);
      newList.add(sum);
    }
    return newList;
  }
}
