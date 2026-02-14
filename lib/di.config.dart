// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import 'core/api_manager.dart' as _i331;
import 'core/bloc/cubit.dart' as _i595;
import 'core/internet_checker.dart' as _i94;
import 'core/repository/home_repo.dart' as _i65;
import 'core/repository/home_repo_remote.dart' as _i152;
import 'core/theming/bloc/cubit.dart' as _i262;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i262.ThemingCubit>(() => _i262.ThemingCubit());
    gh.singleton<_i94.InternetConnectivity>(() => _i94.InternetConnectivity());
    gh.lazySingleton<_i331.ApiManager>(() => _i331.ApiManager());
    gh.factory<_i65.HomeRepo>(
      () => _i152.HomeRepoRemote(gh<_i331.ApiManager>()),
    );
    gh.factory<_i595.HomeCubit>(() => _i595.HomeCubit(gh<_i65.HomeRepo>()));
    return this;
  }
}
