import 'package:flutter_bloc/flutter_bloc.dart';

import 'dashboard_states.dart';

class SwitchDashboardCubit extends Cubit<DashboardState> {
  SwitchDashboardCubit() : super(OverviewState());

  viewOverviewPart() {
    emit(OverviewState());
  }

  viewProductivityPart() {
    emit(ProductivityState());
  }
}
