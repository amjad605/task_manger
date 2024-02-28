import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubits/change_dashboard_body/dashboard_states.dart';
import '../../cubits/change_dashboard_body/switch_states_dashboard.dart';
import 'widgets/custom_above_app_bar.dart';
import 'widgets/overview_part.dart';
import 'widgets/productivity_part.dart';
import 'widgets/tags_dashboard.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SwitchDashboardCubit(),
      child: Builder(builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
            child: BlocBuilder<SwitchDashboardCubit, DashboardState>(
              builder: (context, state) {
                if (state is ProductivityState) {
                  return ListView(
                    children: const [
                      CustomAboveAppBar(),
                      Text(
                        "Hello,\nDerek Doyle👋",
                        style: TextStyle(fontSize: 24),
                      ),
                      SizedBox(height: 20),

                      TagsDashboard(),
                      SizedBox(height: 15),
                      //!PRODUCTIVITY PART!
                      ProductivityPart(),
                    ],
                  );
                }
                return ListView(
                  children: const [
                    CustomAboveAppBar(),
                    Text(
                      "Hello,\nDerek Doyle👋",
                      style: TextStyle(fontSize: 24),
                    ),
                    SizedBox(height: 20),

                    TagsDashboard(),
                    SizedBox(height: 15),
                    //!OVERVIEW PART!
                    OverviewPart(),
                  ],
                );
              },
            ),
          ),
        );
      }),
    );
  }
}
