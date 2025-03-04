import 'package:commerceapp/Config/widgets/error_widget.dart';
import 'package:commerceapp/features/categories/presentation/cubit/categories_details_cubit.dart';
import 'package:commerceapp/features/home/presentation/bloc/home_bloc.dart';
import 'package:commerceapp/features/home/presentation/widgets/grid_view_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:commerceapp/Config/widgets/loading_widget.dart';

class CategoryDetailsPage extends StatelessWidget {
  final String categoryName;
  const CategoryDetailsPage({
    Key? key,
    required this.categoryName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<CategoriesDetailsCubit, CategoriesDetailsState>(
            builder: (context, state) {
          switch (state.status) {
            case Status.loading:
              return LoadingWidget();
            case Status.error:
              return ErrorItem(errorMessage: state.errorMessage);
            case Status.success:
              return gridViewBuilder(products: state.products!);
          }
        }),
      ),
    );
  }
}
