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
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ],
        ),
        TagWidget(
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
