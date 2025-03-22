import 'package:bookly_app_new/constants.dart';
import 'package:bookly_app_new/core/utils/app_router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: kPrimaryColor,
        textTheme: ThemeData.dark().textTheme.apply(
              fontFamily: 'Montserrat',
            ),
      ),
    );
  }
}
