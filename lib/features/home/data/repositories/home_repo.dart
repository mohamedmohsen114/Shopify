import 'package:commerceapp/features/favorites/data/models/favorite_model.dart';
import 'package:dartz/dartz.dart';
import 'package:commerceapp/Config/Network/failure.dart';
import 'package:commerceapp/features/home/data/models/category_model.dart';
import 'package:commerceapp/features/home/data/models/home_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, HomeModel>> getHomeData();
  Future<Either<Failure, CategoryModel>> getCategories();
  Future<Either<Failure, List<Products>>> getCategoriesDetails(
      {required int id});
  Future<Either<Failure, FavoriteModel>> getFavorites();
  Future<Either<Failure, FavoriteModel>> setOrDeleteFromFavorites(
      {required int id});
  Future<Either<Failure, List<Products>>> search({required String text});
}
