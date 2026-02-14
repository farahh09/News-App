import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news/core/theming/extentions.dart';
import 'package:news/models/category_model.dart';

class CategoriesView extends StatelessWidget {
  final Function onClick;

  CategoriesView({super.key, required this.onClick});

  final categories = CategoryModel.getCategories();

  @override
  Widget build(BuildContext context) {
    final isRTL = Directionality.of(context) == TextDirection.RTL;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${'good_morning'.tr()}\n${'news_for_you'.tr()}",
              style: context.title(),
            ),
            SizedBox(height: 16),
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) => SizedBox(height: 12),

              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    onClick(categories[index]);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Container(
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Stack(
                        alignment: index.isOdd
                            ? Alignment.topLeft
                            : Alignment.topRight,
                        children: [
                          Stack(
                            alignment: index.isOdd
                                ? Alignment.bottomLeft
                                : Alignment.bottomRight,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(24),
                                child: Image.asset(
                                  context.isLightTheme()
                                      ? categories[index].lightImage
                                      : categories[index].darkImage,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                ),
                              ),

                              Padding(
                                padding: EdgeInsets.only(
                                  right: index.isOdd ? 0 : 16,
                                  left: index.isOdd ? 16 : 0,
                                  bottom: 16,
                                ),
                                child: Container(
                                  padding: EdgeInsets.only(
                                    left: isRTL? index.isOdd ? 12 : 0 : 0,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: context.surface(),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    spacing: 10,
                                    children: [
                                      Visibility(
                                        visible: index.isOdd,
                                        child: Image.asset(
                                          context.isLightTheme()
                                              ? "assets/images/arrow_left.png"
                                              : "assets/images/arrow_left_dark.png",
                                          width: 54,
                                          height: 54,
                                        ),
                                      ),
                                      Text(
                                        'view_all'.tr(),
                                        style: context.title(),
                                      ),
                                      Visibility(
                                        visible: index.isEven,
                                        child: Image.asset(
                                          context.isLightTheme()
                                              ? "assets/images/arrow_right.png"
                                              : "assets/images/arrow_right_dark.png",
                                          width: 54,
                                          height: 54,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: 40,
                              right: index.isOdd ? 0 : 60,
                              left: index.isOdd ? 60 : 0,
                            ),
                            child: Text(
                              categories[index].id.tr(),
                              style: context.categoryLabel(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              itemCount: categories.length,
            ),
          ],
        ),
      ),
    );
  }
}
