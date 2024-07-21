import 'package:flutter/material.dart';
import 'package:mahmoud/models/category_model.dart';
import 'package:mahmoud/widgets/category_card.dart';

class CategoryList extends StatelessWidget {
  CategoryList({
    super.key,
  });

  final List<ItemCategory> items = [
    ItemCategory(
      title: 'business',
      image: 'assets/business2.jpg',
    ),
    ItemCategory(
      title: 'entertainment',
      image: 'assets/entertainment.jfif',
    ),
    ItemCategory(
      title: 'general',
      image: 'assets/general.jfif',
    ),
    ItemCategory(
      title: 'health',
      image: 'assets/health.avif',
    ),
    ItemCategory(
      title: 'science',
      image: 'assets/science.jfif',
    ),
    ItemCategory(
      title: 'sports',
      image: 'assets/sports.avif',
    ),
    ItemCategory(
      title: 'technology',
      image: 'assets/technology.jfif',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        itemCount: items.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => CategoryCard(
          item: items[index],
        ),
      ),
    );
  }
}
