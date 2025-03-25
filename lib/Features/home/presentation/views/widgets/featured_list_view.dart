import 'package:bookly_app_new/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app_new/Features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app_new/core/utils/app_router.dart';
import 'package:bookly_app_new/core/widgets/custom_error_widget.dart';
import 'package:bookly_app_new/core/widgets/custom_loading_indecator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'custom_book_image.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: state.books.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: GestureDetector(
                      onDoubleTap: () {
                        GoRouter.of(context).push(
                          AppRouter.kBookDetailsView,
                          extra: state.books[index],
                        );
                      },
                      child: CustomBookImage(
                        imageUrl: state.books[index].volumeInfo.imageLinks?.thumbnail ?? '',
                      ),
                    ),
                  );
                }),
          );
        } else if (state is FeaturedBooksFailure) {
          return CustomErrorWidget(
            errMessage: state.errMessage,
          );
        } else {
          return const CustomLoadingIndecator();
        }
      },
    );
  }
}
