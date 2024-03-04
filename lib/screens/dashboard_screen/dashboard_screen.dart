import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manger/screens/StatisticsScreen/statistics_screen.dart';
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
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: CustomAboveAppBar(),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: AnimatedTextKit(
                      pause: Duration(milliseconds: 600),
                      displayFullTextOnTap: true,
                      totalRepeatCount: 1,
                      isRepeatingAnimation: true,
                      animatedTexts: [
                        TypewriterAnimatedText(
                          speed: Duration(milliseconds: 150),
                          "Hello,\nDerek Doyle👋",
                          textStyle: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.04),
                        )
                      ]),
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 20)),
              SliverToBoxAdapter(
                child: BlocBuilder<SwitchDashboardCubit, DashboardState>(
                  builder: (context, state) {
                    if (state is ProductivityState) {
                      return ListView(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        children: const [
                          // CustomAboveAppBar(),
                          // Text(
                          //   "Hello,\nDerek Doyle👋",
                          //   style: TextStyle(fontSize: 24),
                          // ),
                          // SizedBox(height: 20),
                          TagsDashboard(),
                          SizedBox(height: 15),
                          //!PRODUCTIVITY PART!
                          ProductivityPart(),
                        ],
                      );
                    }
                    return ListView(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      children: const [
                        // CustomAboveAppBar(),
                        // Text(
                        //   "Hello,\nDerek Doyle👋",
                        //   style: TextStyle(fontSize: 24),
                        // ),
                        // SizedBox(height: 20),

                        TagsDashboard(),
                        SizedBox(height: 15),
                        //!OVERVIEW PART!
                        OverviewPart(),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
