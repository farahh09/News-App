import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/models/category_model.dart';

class CategoriesView extends StatelessWidget {
  Function onClick;

  CategoriesView({super.key, required this.onClick});

  var categories = CategoryModel.getCategories();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Good Morning\nHere is Some News For You",
            style: GoogleFonts.inter(fontSize: 24, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 16),
          Expanded(
            child: ListView.separated(
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
                                child: Image.asset(categories[index].image, fit: BoxFit.cover, width: double.infinity,),
                              ),

                              Padding(
                                padding: EdgeInsets.only(
                                  right: index.isOdd ? 0 : 16,
                                  left: index.isOdd ? 16 : 0,
                                  bottom: 16,
                                ),
                                child: Container(
                                  padding: EdgeInsets.only(
                                    left: index.isOdd ? 0 : 12,
                                    right: index.isEven ? 0 : 12,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.white.withOpacity(0.5),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    spacing: 10,
                                    children: [
                                      Visibility(
                                        visible: index.isOdd,
                                        child: Image.asset(
                                          "assets/images/arrow_left.png",
                                          width: 54,
                                          height: 54,
                                        ),
                                      ),
                                      Text(
                                        "View All",
                                        style: GoogleFonts.poppins(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Visibility(
                                        visible: index.isEven,
                                        child: Image.asset(
                                          "assets/images/arrow_right.png",
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
                              categories[index].label,
                              style: GoogleFonts.inter(
                                fontSize: 30,
                                fontWeight: FontWeight.w600,
                                color: Colors.white
                              ),
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
          ),
        ],
      ),
    );
  }
}
