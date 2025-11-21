import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_app/core/theme/appColors.dart';
import 'package:movie_app/core/widgets/custom_search_widget.dart';
import 'package:movie_app/features/search/presentation/controllers/cubit/genres_cubit.dart';
import 'package:movie_app/features/search/presentation/controllers/cubit/search_cubit.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key, required this.data});
  final String data;
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<SearchCubit>().search(widget.data);
    context.read<GenresCubit>().fetchGenres();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Appcolors.ScaffoldCaller,
          appBar: AppBar(
            backgroundColor: Appcolors.ScaffoldCaller,
            centerTitle: true,
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.arrow_back_ios_new, color: Appcolors.white),
            ),
            title: Text(
              "Search_screen".tr(),
              style: TextStyle(color: Appcolors.white),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                //  Search Field
                TextFormField(
                  controller: controller,
                  onChanged: (value) {
                    context.read<SearchCubit>().search(value);
                  },
                  style: TextStyle(color: Appcolors.white),
                  cursorColor: Appcolors.white,
                  decoration: InputDecoration(
                    suffixIcon: Icon(
                      Icons.search,
                      size: 30,
                      color: Appcolors.grey,
                    ),
                    fillColor: Appcolors.textFormColor,
                    filled: true,
                    hintText: "Search",
                    hintStyle: TextStyle(color: Appcolors.white),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                //  Search Results
                Expanded(
                  child: BlocBuilder<SearchCubit, SearchState>(
                    builder: (context, state) {
                      if (state is SearchLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is SearchSuccess) {
                        var data = state.data;

                        if (data.isEmpty) {
                          return Center(
                            child: Lottie.asset(
                              "assets/animation/Empty box.json",
                            ),
                          );
                        }
                        //==================هنا اللعبه
                        return BlocBuilder<GenresCubit, GenresState>(
                          builder: (context, genresState) {
                            Map<int, String> genresMap = {};
                            if (genresState is GenresSuccess) {
                              genresMap = genresState.genres;
                            }

                            return custom_search_widget(
                              data: data,
                              genresMap: genresMap,
                              runtimeType: runtimeType,
                            );
                          },
                        );
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
