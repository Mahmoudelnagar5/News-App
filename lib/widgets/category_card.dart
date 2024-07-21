import 'package:flutter/material.dart';
import 'package:mahmoud/models/category_model.dart';
import 'package:mahmoud/views/category_view.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.item});
  final ItemCategory item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return CategoryView(
                categoryName: item.title,
              );
            },
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: Container(
          width: 170,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: const Color.fromARGB(255, 195, 5, 116),
            ),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(item.image),
            ),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text(
                item.title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
