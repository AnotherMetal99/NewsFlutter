import '../models/categories.dart';
import '../web_services/categories_web_services.dart';

class CategoriesRepository {
  final CategoriesWebServices categoriesWebServices;

  CategoriesRepository(this.categoriesWebServices);

  Future<List<Category>> getAllcategories() async {
    final categories = await categoriesWebServices.getAllCategories();
    return categories.map((category) => Category.fromJson(category)).toList();
  }
}
