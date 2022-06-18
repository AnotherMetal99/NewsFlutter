import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'business_logic/cubit/categories_cubit.dart';
import 'data/repository/categories_repository.dart';
import 'data/web_services/categories_web_services.dart';
import 'presentation/screens/categories_details_screen.dart';
import 'presentation/screens/categories_screen.dart';

import 'constants/strings.dart';
import 'data/models/categories.dart';

class AppRouter {
  late CategoriesRepository categoriesRepository;
  late CategoriesCubit categoriesCubit;

  AppRouter() {
    categoriesRepository = CategoriesRepository(CategoriesWebServices());
    categoriesCubit = CategoriesCubit(categoriesRepository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case newsScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext contxt) => categoriesCubit,
            child: CharactersScreen(),
          ),
        );

      case newDetailsScreen:
        final character = settings.arguments as Category;

        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) =>
                CategoriesCubit(categoriesRepository),
            child: CategoryDetailsScreen(
              category: character,
            ),
          ),
        );
    }
  }
}
