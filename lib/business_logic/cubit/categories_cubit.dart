import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/models/categories.dart';
import '../../data/repository/categories_repository.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final CategoriesRepository categoriesRepository;
  List<Category> categories = [];

  CategoriesCubit(this.categoriesRepository) : super(CategoriesInitial());

  List<Category> getAllCharacters() {
    categoriesRepository.getAllcategories().then((categories) {
      emit(CategoriesLoaded(categories));
      this.categories = categories;
    });

    return categories;
  }
}
