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
import 'package:news/core/api_manager.dart' as _i885;
import 'package:news/core/bloc/cubit.dart' as _i451;
import 'package:news/core/internet_checker.dart' as _i405;
import 'package:news/core/repository/local/home_local_repo.dart' as _i585;
import 'package:news/core/repository/local/home_local_repo_implementation.dart'
    as _i130;
import 'package:news/core/repository/remote/home_remote_repo_implementation.dart'
    as _i774;
import 'package:news/core/repository/remote/home_repo_remote.dart' as _i709;
import 'package:news/core/theming/bloc/cubit.dart' as _i388;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i388.ThemingCubit>(() => _i388.ThemingCubit());
    gh.singleton<_i405.InternetConnectivity>(
      () => _i405.InternetConnectivity(),
    );
    gh.lazySingleton<_i885.ApiManager>(() => _i885.ApiManager());
    gh.factory<_i585.HomeLocalRepo>(() => _i130.HomeRepoLocalImpl());
    gh.factory<_i709.HomeRemoteRepo>(
      () => _i774.HomeRepoRemoteImpl(gh<_i885.ApiManager>()),
    );
    gh.factory<_i451.HomeCubit>(
      () => _i451.HomeCubit(
        gh<_i709.HomeRemoteRepo>(),
        gh<_i585.HomeLocalRepo>(),
      ),
    );
    return this;
  }
}
