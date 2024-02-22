import 'package:flutter_bloc/flutter_bloc.dart';


enum StatisticsEvent { updateSelectedIndex }

class StatisticsCubit extends Cubit<int> {
  StatisticsCubit() : super(0);


  void updateSelectedIndex(int index) {
    emit(index);
  }
}
