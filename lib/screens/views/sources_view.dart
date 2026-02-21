import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:news/core/bloc/cubit.dart';
import 'package:news/core/bloc/states.dart';
import 'package:news/core/theming/extensions.dart';
import 'package:news/screens/news_screen.dart';

class SourcesView extends StatefulWidget {
  final String categoryId;

  const SourcesView({super.key, required this.categoryId});

  @override
  State<SourcesView> createState() => _SourcesViewState();
}

class _SourcesViewState extends State<SourcesView> {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getSources(widget.categoryId);
  }
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        if (state is GetSourcesLoadingState) {
          context.loaderOverlay.show();
        } else if (context.loaderOverlay.visible) {
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
    );
  }
}
