import 'package:admin_boda/feature/admin/dashboard/widgets/activities.dart';
import 'package:flutter/widgets.dart';

class BottomSession extends StatelessWidget {
  const BottomSession({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 35, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Activities(),
        ],
      ),
    );
  }
}
