import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:news/core/theming/base_colors.dart';
import 'package:news/core/theming/bloc/states.dart';
import 'package:news/core/theming/dark_colors.dart';
import 'package:news/core/theming/light_colors.dart';

@injectable
class ThemingCubit extends Cubit<ThemingStates> {
  ThemingCubit() : super(ThemingInitState());

  BaseColors colors = LightColors();

  static ThemingCubit get(context) => BlocProvider.of(context);

  void changeTheming() {
    if (colors is LightColors) {
      colors = DarkColors();
    } else {
      colors = LightColors();
    }
    emit(ChangeThemingState());
  }
}