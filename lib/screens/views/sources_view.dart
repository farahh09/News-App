import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:news/core/bloc/cubit.dart';
import 'package:news/core/bloc/states.dart';
import 'package:news/core/theming/extentions.dart';
import 'package:news/di.dart';
import 'package:news/screens/news_screen.dart';

class SourcesView extends StatelessWidget {
  final String categoryId;

  const SourcesView({super.key, required this.categoryId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) => getIt<HomeCubit>()..getSources(categoryId),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {
          if (state is GetSourcesLoadingState) {
            context.loaderOverlay.show();
          } else {
            context.loaderOverlay.hide();
          }
        },
        builder: (context, state) {
          var bloc = BlocProvider.of<HomeCubit>(context);
          return Column(
            children: [
              DefaultTabController(
                length: bloc.sources.length,
                initialIndex: bloc.selectedIndex,
                child: TabBar(
                  isScrollable: true,
                  indicatorColor: Colors.black,
                  labelStyle: context.titleMedium(),
                  unselectedLabelStyle: context.titleSmall(),
                  onTap: (index) {
                    bloc.changeSelectedSource(index);
                  },
                  tabAlignment: TabAlignment.start,
                  dividerColor: Colors.transparent,
                  tabs: bloc.sources
                      .map((e) => Tab(child: Text(e.name ?? "")))
                      .toList(),
                ),
              ),
              Expanded(child: NewsScreen()),
            ],
          );
        },
      ),
    );
  }
}
