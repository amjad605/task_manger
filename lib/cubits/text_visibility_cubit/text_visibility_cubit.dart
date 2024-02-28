import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'text_visibility_state.dart';

class TextVisibilityCubit extends Cubit<TextVisibilityState> {
  TextVisibilityCubit() : super(TextVisibilityInitial());
}
