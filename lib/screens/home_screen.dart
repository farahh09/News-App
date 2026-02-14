import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
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
        drawer: DrawerView(onClick: onDrawerClicked),
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            selectedCategory == null ? "Home" : selectedCategory!.label,
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: ImageIcon(AssetImage('assets/images/search.png')),
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
