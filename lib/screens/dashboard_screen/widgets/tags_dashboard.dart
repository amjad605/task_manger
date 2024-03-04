import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../constants.dart';
import '../../../cubits/change_dashboard_body/dashboard_states.dart';
import '../../../cubits/change_dashboard_body/switch_states_dashboard.dart';
import 'tag_widget.dart';

class TagsDashboard extends StatelessWidget {
  const TagsDashboard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TagWidget(
          size: BlocProvider.of<SwitchDashboardCubit>(context).state
                  is OverviewState
              ? Size(MediaQuery.of(context).size.width * 0.36,
                  MediaQuery.of(context).size.height * 0.055)
              : Size(MediaQuery.of(context).size.width * 0.30,
                  MediaQuery.of(context).size.height * 0.055),
          color: BlocProvider.of<SwitchDashboardCubit>(context).state
                  is OverviewState
              ? kMainColor
              : null,
          onTap: () {
            BlocProvider.of<SwitchDashboardCubit>(context).viewOverviewPart();
          },
          children: const [
            Text(
              "Overview",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ],
        ),
        TagWidget(
          size: BlocProvider.of<SwitchDashboardCubit>(context).state
                  is ProductivityState
              ? Size(MediaQuery.of(context).size.width * 0.38,
                  MediaQuery.of(context).size.height * 0.055)
              : Size(MediaQuery.of(context).size.width * 0.33,
                  MediaQuery.of(context).size.height * 0.055),
          color: BlocProvider.of<SwitchDashboardCubit>(context).state
                  is ProductivityState
              ? kMainColor
              : null,
          onTap: () {
            BlocProvider.of<SwitchDashboardCubit>(context)
                .viewProductivityPart();
          },
          children: const [
            Text(
              "Productivity",
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
