import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manger/Constants/constants.dart';
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
    double screenHeight = MediaQuery.of(context).size.height * 0.04;
    return BlocProvider(
      create: (context) => SwitchDashboardCubit(),
      child: Builder(builder: (context) {
        return SafeArea(
          child: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: CustomAboveAppBar(),
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 20)),
              SliverToBoxAdapter(
                child: BlocBuilder<SwitchDashboardCubit, DashboardState>(
                    builder: (context, state) {
                  return ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: const [
                      // CustomAboveAppBar(),
                      // Text(
                      //   "Hello,\nDerek Doyle👋",
                      //   style: TextStyle(fontSize: 24),
                      // ),
                      // SizedBox(height: 20),

                      SizedBox(height: 15),
                      //!PRODUCTIVITY PART!
                      ProductivityPart(),
                    ],
                  );
                }),
              ),
            ],
          ),
        );
      }),
    );
  }
}
