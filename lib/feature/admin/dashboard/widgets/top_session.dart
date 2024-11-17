import 'package:admin_boda/commons/common_imports/common_libs.dart';
import 'package:admin_boda/utils/constants/assets_manager.dart';
import 'package:flutter_svg/svg.dart';

class TopSession extends StatefulWidget {
  const TopSession({super.key});

  @override
  State<TopSession> createState() => _TopSessionState();
}

class _TopSessionState extends State<TopSession> {
  List<Map<String, dynamic>> data = [
    {'title': 'Profit', 'value': '592k', 'icon': AppAssets.earningSvgIcon},
    {'title': 'Bookings', 'value': '592k', 'icon': AppAssets.bookingSvgIcon},
    {'title': 'Total Users', 'value': '592k'},
    {'title': 'Total Venders', 'value': '592k'},
    {'title': 'Total Sent To Vender', 'value': '592k'},
    {'title': 'Total Activities ', 'value': '592k'},
    // {'title': 'Total Rating', 'value': '592k'},
  ];
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: data
          .map(
            (e) => Container(
              height: 80,
              width: 180,
              margin: const EdgeInsets.only(right: 20, bottom: 20),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: context.whiteColor,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: context.greyColor.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        e['title'],
                        style: getRegularStyle(
                            color: context.blackColor,
                            fontSize: MyFonts.size14),
                      ),
                      if (e['icon'] != null)
                        SvgPicture.asset(
                          e['icon'],
                          height: 15,
                          width: 15,
                        )
                    ],
                  ),
                  Text(
                    e['value'],
                    style: getSemiBoldStyle(
                        color: context.blackColor, fontSize: MyFonts.size20),
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}
