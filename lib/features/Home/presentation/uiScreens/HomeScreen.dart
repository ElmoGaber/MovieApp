import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/theme/appColors.dart';
import 'package:movie_app/features/Home/presentation/component/custom_gride_view.dart';
import 'package:movie_app/features/Home/presentation/component/custom_text.dart';
import 'package:movie_app/features/Home/presentation/controller/UpComing/cubit/up_coming_cubit.dart';
import 'package:movie_app/features/Home/presentation/controller/cubit/now_playing_cubit_cubit.dart';
import 'package:movie_app/features/Home/presentation/controller/popularCubit/cubit/popular_movie_cubit.dart';
import 'package:movie_app/features/Home/presentation/controller/top_rate/cubit/top_rate_cubit.dart';
import 'package:movie_app/features/MovieDetailes/presentation/controllers/cubit/movie_detailes_cubit.dart';
import 'package:movie_app/features/search/presentation/controllers/cubit/genres_cubit.dart';
import 'package:movie_app/features/search/presentation/controllers/cubit/search_cubit.dart';
import 'package:movie_app/features/search/presentation/ui_screens/search_screen.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NowPlayingCubitCubit()..get_now_playing(),
        ),
        BlocProvider(create: (context) => TopRateCubit()..get_Top_Rate()),
        BlocProvider(create: (context) => UpComingCubit()..Get_UpComing_Data()),
        BlocProvider(
          create: (context) => PopularMovieCubit()..get_popularMovie(),
        ),
      ],
      child: Scaffold(
        backgroundColor: Appcolors.ScaffoldCaller,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: DefaultTabController(
              length: 4,
              child: Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Column(
                  children: [
                    CustomText(title: 'watch'.tr()),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: controller,
                      onFieldSubmitted: (value) {
                        if (controller.text.isNotEmpty) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MultiBlocProvider(
                                providers: [
                                  BlocProvider(
                                    create: (context) => SearchCubit(),
                                  ),
                                  BlocProvider(
                                    create: (context) => MovieDetailesCubit(),
                                  ),
                                  BlocProvider(
                                    create: (context) => GenresCubit(),
                                  ),
                                ],
                                child: SearchScreen(data: value),
                              ),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Please enter text',
                                style: TextStyle(color: Appcolors.red),
                              ),
                            ),
                          );
                        }
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
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),

                    BlocConsumer<NowPlayingCubitCubit, NowPlayingCubitState>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        if (state is NowPlayingCubitIsLoading) {
                          return Center(child: CircularProgressIndicator());
                        }
                        if (state is NowPlayingCubitSuccess) {
                          final movies = state.data;

                          return CarouselSlider.builder(
                            itemCount: 10,
                            itemBuilder: (context, index, realIndex) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.network(
                                    "https://image.tmdb.org/t/p/w500/////${movies.results[index].posterPath}",
                                  ),
                                ),
                              );
                            },
                            options: CarouselOptions(
                              autoPlay: true,
                              viewportFraction: .4,
                            ),
                          );
                        }
                        return Container();
                      },
                    ),
                    SizedBox(height: 20),

                    TabBar(
                      labelColor: Appcolors.white,
                      indicatorColor: Appcolors.white,
                      tabs: [
                        Tab(text: context.tr("now_playing")),
                        Tab(text: context.tr("upcoming")),
                        Tab(text: context.tr("top_rated")),
                        Tab(text: context.tr("popular")),
                      ],
                      dividerHeight: 0,
                      dividerColor: Colors.white,
                    ),
                    Expanded(
                      child: TabBarView(
                        clipBehavior: Clip.hardEdge,
                        children: [
                          //Now Playing===========================>
                          BlocConsumer<
                            NowPlayingCubitCubit,
                            NowPlayingCubitState
                          >(
                            listener: (context, state) {},
                            builder: (context, state) {
                              if (state is NowPlayingCubitIsLoading) {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              if (state is NowPlayingCubitSuccess) {
                                var data = state.data;
                                return CustomGrideView(data: data.results);
                              }
                              return Container();
                            },
                          ),

                          //upcoming===========================>
                          BlocConsumer<UpComingCubit, UpComingState>(
                            listener: (context, state) {},
                            builder: (context, state) {
                              if (state is UpComingLoading) {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              if (state is UpComingSuccess) {
                                var data = state.data;
                                return CustomGrideView(data: data.results);
                              }
                              return Container();
                            },
                          ),

                          //TopRating===========================>
                          BlocConsumer<TopRateCubit, TopRateState>(
                            listener: (context, state) {},
                            builder: (context, state) {
                              if (state is TopRateLoading) {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              if (state is TopRateSuccess) {
                                var data = state.data;
                                return CustomGrideView(data: data.results);
                              }
                              return Container();
                            },
                          ),

                          //Popular===========================>
                          BlocConsumer<PopularMovieCubit, PopularMovieState>(
                            listener: (context, state) {},
                            builder: (context, state) {
                              if (state is PopularMovieLoading) {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              if (state is PopularMovieSuccess) {
                                var data = state.data;
                                return CustomGrideView(data: data.results);
                              }
                              return Container();
                            },
                          ),
                        ],
                      ),
                    ),

                    // ElevatedButton(
                    //   onPressed: () {
                    //     if (context.locale == Locale('en')) {
                    //       context.setLocale(Locale('ar'));
                    //     } else {
                    //       context.setLocale(Locale('en'));
                    //     }
                    //   },
                    //   child: Text('click'),
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
