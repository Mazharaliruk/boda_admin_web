import 'package:admin_boda/commons/common_functions/padding.dart';
import 'package:admin_boda/commons/common_imports/common_libs.dart';

class CommissionHistory extends StatelessWidget {
  const CommissionHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        padding24,
        Text(
          'Commission History',
          style:
              getBoldStyle(color: context.blackColor, fontSize: MyFonts.size18),
        ),
        padding24,
        Container(
          height: 58.h,
          width: double.infinity,
          color: context.greyColor,
          padding: const EdgeInsets.only(left: 10, right: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 110,
                child: Text('Booking ID',
                    style: getBoldStyle(
                        color: context.blackColor, fontSize: MyFonts.size10)),
              ),
              SizedBox(
                width: 110,
                child: Text('Date',
                    style: getBoldStyle(
                        color: context.blackColor, fontSize: MyFonts.size10)),
              ),
              SizedBox(
                width: 100,
                child: Text('      Type',
                    style: getBoldStyle(
                        color: context.blackColor, fontSize: MyFonts.size10)),
              ),
              SizedBox(
                width: 100,
                child: Text('Payment Type',
                    style: getBoldStyle(
                        color: context.blackColor, fontSize: MyFonts.size10)),
              ),
              SizedBox(
                width: 75,
                child: Text('Amount',
                    style: getBoldStyle(
                        color: context.blackColor, fontSize: MyFonts.size12)),
              ),
            ],
          ),
        ),
        ListView.builder(
            itemCount: 5,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.only(top: 20, bottom: 100),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 110,
                        child: Text('c53f319a-50dc-44e5-9df7',
                            maxLines: 2,
                            style: getBoldStyle(
                                color: context.blackColor,
                                fontSize: MyFonts.size8)),
                      ),
                      SizedBox(
                        width: 110,
                        child: Text('14.09.2015 00:00',
                            style: getBoldStyle(
                                color: context.blackColor,
                                fontSize: MyFonts.size8)),
                      ),
                      SizedBox(
                        width: 100,
                        child: Text('SELL',
                            textAlign: TextAlign.center,
                            style: getBoldStyle(
                                color: context.blackColor,
                                fontSize: MyFonts.size8)),
                      ),
                      SizedBox(
                        width: 100,
                        child: Text('Cash',
                            textAlign: TextAlign.center,
                            style: getBoldStyle(
                                color: context.blackColor,
                                fontSize: MyFonts.size8)),
                      ),
                      SizedBox(
                        width: 100,
                        child: Text('30.00',
                            textAlign: TextAlign.center,
                            style: getBoldStyle(
                                color: context.blackColor,
                                fontSize: MyFonts.size8)),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Divider(
                      color: context.lightGreyColor,
                    ),
                  ),
                ],
              );
            })
      ],
    );
  }
}
