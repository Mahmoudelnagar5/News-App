import 'package:flutter/material.dart';
import 'package:mahmoud/widgets/new_list_view_builder.dart';

// ignore: must_be_immutable
class CategoryView extends StatelessWidget {
  const CategoryView({super.key, required this.categoryName});

  final String categoryName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(20.0),
      child: CustomScrollView(
        slivers: [
          NewsListViewBuilder(
            categoryName: categoryName,
          )
        ],
      ),
    ));
  }
}
