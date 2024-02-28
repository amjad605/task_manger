import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'text_visibility_state.dart';

class TextVisibilityCubit extends Cubit<TextVisibilityState> {
  TextVisibilityCubit() : super(TextVisibilityInitial());
  bool obscure=true;
  ChangeVisibility(){
    obscure=!obscure;
    emit(TextVisibilityChanged());
  }
  SetVisibility({required bool obscure }){
    this.obscure=obscure;
    emit(TextVisibilityChanged());
  }
}
