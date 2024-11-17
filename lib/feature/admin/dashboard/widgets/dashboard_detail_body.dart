import 'package:admin_boda/commons/common_functions/padding.dart';
import 'package:admin_boda/feature/admin/dashboard/widgets/activities.dart';
import 'package:admin_boda/feature/admin/dashboard/widgets/uniqe_vistor_widget.dart';
import 'package:admin_boda/feature/admin/dashboard/widgets/top_session.dart';
import 'package:flutter/material.dart';

class DashboardDetailBody extends StatefulWidget {
  const DashboardDetailBody({super.key});

  @override
  State<DashboardDetailBody> createState() => _DashboardDetailBodyState();
}

class _DashboardDetailBodyState extends State<DashboardDetailBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          const TopSession(),
          const UniqeVisitorWidget(),
          const Activities(),
          padding56
        ],
      ),
    );
  }
}
