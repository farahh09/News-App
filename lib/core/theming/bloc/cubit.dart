import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:news/core/shared_pref.dart';
import 'package:news/core/theming/base_colors.dart';
import 'package:news/core/theming/bloc/states.dart';
import 'package:news/core/theming/dark_colors.dart';
import 'package:news/core/theming/light_colors.dart';

@injectable
class ThemingCubit extends Cubit<ThemingStates> {

  ThemingCubit() : super(ThemingInitState());

  BaseColors colors = LightColors();

  static ThemingCubit get(context){
    return BlocProvider.of(context);
  }

  void getTheme(){
    bool isDark = SharedPref.getTheme() ?? false;
    colors = isDark ? DarkColors() : LightColors();
    emit(GetThemeSuccessState());
  }

  Future<void> changeTheming() async {
    emit(ChangeThemingState());

    if (colors is LightColors) {
      colors = DarkColors();
      await SharedPref.saveTheme(true);
    } else {
      colors = LightColors();
      await SharedPref.saveTheme(false);
    }
    emit(ChangeThemingSuccessState());
  }
}