import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/bloc/cubit.dart';
import 'package:news/core/bloc/states.dart';
import 'package:news/core/theming/extensions.dart';

class SearchView extends StatefulWidget {
  final String categoryId;
  final String query;
  const SearchView({
    super.key,
    required this.categoryId,
    required this.query,
  });

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {

  String updatedQuery = '';
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      builder: (context, state) {
        var bloc = BlocProvider.of<HomeCubit>(context);
        if (updatedQuery != widget.query) {
          updatedQuery = widget.query;
          bloc.searchArticles(widget.query);
        }
        final articles = bloc.filteredArticles;

        if (state is GetNewsDataErrorState) {
          return Center(child: Text('something_went_wrong'.tr()));
        }
        else if (state is GetSourcesLoadingState ||
            state is GetNewsDataLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }
        else if (articles.isEmpty) {
          return Center(child: Text('no_data'.tr()));
        }

        return ListView.builder(
          itemCount: articles.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  backgroundColor: Colors.transparent,
                  builder: (context) {
                    return Padding(
                      padding: const EdgeInsets.all(16),
                      child: Container(
                        decoration: BoxDecoration(
                          color: context.onSurface(),
                          borderRadius: BorderRadius.circular(28),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(16),
                                      child: CachedNetworkImage(
                                        imageUrl:
                                        articles[index].urlToImage ?? "",
                                        height: 240,
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      articles[index].description ?? "",
                                      maxLines: 5,
                                      style: context.titleSmall().copyWith(
                                          color: context.background()),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 8),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: context.background(),
                                  padding: EdgeInsets.symmetric(vertical: 16),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    'view_full_article'.tr(),
                                    style: context.titleMedium(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: context.onSurface()),
                ),
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.only(left: 16, top: 16, right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 10,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: CachedNetworkImage(
                        imageUrl: articles[index].urlToImage ?? "",
                        height: 220,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        placeholder: (context, url) =>
                            Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) =>
                            Center(child: Icon(Icons.error)),
                      ),
                    ),
                    Text(articles[index].title ?? "",
                        maxLines: 2, style: context.titleMedium()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            "${'by'.tr()} : ${articles[index].author ?? ""}",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: context.bodySmall(),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            articles[index].publishedAt?.substring(0, 10) ??
                                "",
                            maxLines: 1,
                            textAlign: TextAlign.end,
                            style: context.bodySmall(),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }, listener: (BuildContext context, HomeStates state) {  },
    );
  }
}



