import 'package:flutter/material.dart';
import 'app_router.dart';

void main() {
  runApp(NewsApp(
    appRouter: AppRouter(),
  ));
}

class NewsApp extends StatelessWidget {
  final AppRouter appRouter;

  const NewsApp({Key? key, required this.appRouter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
