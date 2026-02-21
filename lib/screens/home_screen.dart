import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/bloc/cubit.dart';
import 'package:news/core/bloc/states.dart';
import 'package:news/core/theming/extensions.dart';
import 'package:news/di.dart';
import 'package:news/models/category_model.dart';
import 'package:news/screens/views/categories_view.dart';
import 'package:news/screens/views/drawer_view.dart';
import 'package:news/screens/views/search_view.dart';
import 'package:news/screens/views/sources_view.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  bool isSearching = false;
  String query = '';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) => getIt<HomeCubit>(),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (BuildContext context,  state) {  },
        builder: (BuildContext context,  state) {
          return Scaffold(
            backgroundColor: context.background(),
            drawer: DrawerView(onClick: onDrawerClicked),
            appBar: AppBar(
              backgroundColor: context.background(),
              automaticallyImplyLeading: isSearching && selectedCategory != null
                  ? false
                  : true,
              centerTitle: true,
              iconTheme: IconThemeData(color: context.onSurface()),
              title: isSearching && selectedCategory != null
                  ? Container(
                decoration: BoxDecoration(
                  border: Border.all(color: context.onSurface()),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: ImageIcon(
                        AssetImage('assets/images/search.png'),
                        color: context.secondary(),
                        size: 24,
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        autofocus: true,
                        style: context.titleMedium(),
                        decoration: InputDecoration(
                          hintText: 'search'.tr(),
                          hintStyle: context.titleMedium().copyWith(
                            color: context.secondary(),
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                        ),
                        onChanged: (val) {
                          query = val;
                          setState(() {});
                        },
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.close, color: context.onSurface()),
                      onPressed: () {
                        isSearching = false;
                        query = '';
                        setState(() {});
                      },
                    ),
                  ],
                ),
              )
                  : Text(
                selectedCategory == null
                    ? 'home'.tr()
                    : selectedCategory!.id.tr(),
                style: context.titleLarge(),
              ),
              actions: [
                if (!isSearching)
                  IconButton(
                    onPressed: () {
                      if (selectedCategory != null && !isSearching) {
                        isSearching = true;
                      } else {
                        isSearching = false;
                      }
                      setState(() {});
                    },
                    icon: ImageIcon(
                      AssetImage('assets/images/search.png'),
                      color: context.onSurface(),
                    ),
                  ),
              ],
            ),
            body: selectedCategory == null
                ? CategoriesView(onClick: onClick)
                : isSearching
                ? SearchView(categoryId: selectedCategory!.id, query: query)
                : SourcesView(categoryId: selectedCategory!.id),
          );
        },

      ),
    );
  }

  CategoryModel? selectedCategory;

  void onDrawerClicked() {
    selectedCategory = null;
    isSearching = false;
    query = '';
    Navigator.pop(context);
    setState(() {});
  }

  void onClick(CategoryModel category) {
    selectedCategory = category;
    isSearching = false;
    query = '';
    setState(() {});
  }
}
