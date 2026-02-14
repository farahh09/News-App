import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:news/core/theming/extentions.dart';
import 'package:news/models/category_model.dart';
import 'package:news/screens/views/categories_view.dart';
import 'package:news/screens/views/drawer_view.dart';
import 'package:news/screens/views/sources_view.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      child: Scaffold(
        backgroundColor: context.background(),
        drawer: DrawerView(onClick: onDrawerClicked),
        appBar: AppBar(
          backgroundColor: context.background(),
          centerTitle: true,
          iconTheme: IconThemeData(
            color: context.onSurface(),
          ),
          title: Text(
            selectedCategory == null
                ? 'home'.tr()
                : selectedCategory!.id.tr(),
            style: context.titleLarge(),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: ImageIcon(
                AssetImage('assets/images/search.png'),
                color: context.onSurface(),
              ),
            ),
          ],
        ),

        body: selectedCategory == null
            ? CategoriesView(onClick: onClick)
            : SourcesView(categoryId: selectedCategory!.id),
      ),
    );
  }

  CategoryModel? selectedCategory;

  void onDrawerClicked() {
    selectedCategory = null;
    Navigator.pop(context);
    setState(() {});
  }

  void onClick(CategoryModel category) {
    selectedCategory = category;
    setState(() {});
  }
}