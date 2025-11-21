import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/localDataHelper/localDataHelper.dart';
import 'package:movie_app/core/model/moviemodel.dart';
import 'package:movie_app/core/theme/appColors.dart';
import 'package:movie_app/features/MovieDetailes/presentation/components/back_drop_image.dart';
import 'package:movie_app/features/MovieDetailes/presentation/components/customicon.dart';
import 'package:movie_app/features/MovieDetailes/presentation/components/movie__detaile__tab_bar.dart';
import 'package:movie_app/features/MovieDetailes/presentation/components/poster__image.dart';
import 'package:movie_app/features/MovieDetailes/presentation/components/video__row_info.dart';
import 'package:movie_app/features/MovieDetailes/presentation/components/video_title.dart';
import 'package:movie_app/features/MovieDetailes/presentation/controllers/RevieusCubit/review_cubit_cubit.dart';
import 'package:movie_app/features/MovieDetailes/presentation/controllers/castCubit/cast_cubit.dart';
import 'package:movie_app/features/MovieDetailes/presentation/controllers/cubit/movie_detailes_cubit.dart';

class Moviedetailes extends StatefulWidget {
  const Moviedetailes({super.key, required this.move});
  final MovieModel move;
  @override
  State<Moviedetailes> createState() => _MoviedetailesState();
}

class _MoviedetailesState extends State<Moviedetailes> {
  @override
  void initState() {
    super.initState();
    context.read<MovieDetailesCubit>().Get_movie_Detailes(
      widget.move.id.toString(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Appcolors.ScaffoldCaller,
        appBar: AppBar(
          backgroundColor: Appcolors.ScaffoldCaller,
          leading: IconButton(
            padding: const EdgeInsets.only(left: 10),
            icon: Icon(Icons.arrow_back_ios, color: Appcolors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          centerTitle: true,
          title: Text(
            "detailes",
            style: TextStyle(
              color: Appcolors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            BlocBuilder<MovieDetailesCubit, MovieDetailesState>(
              builder: (context, state) {
                return IconButton(
                  padding: const EdgeInsets.only(right: 10),
                  icon: localDataHelper.movies!.containsKey(widget.move.id)
                      ? Icon(Icons.bookmark_added, color: Appcolors.white)
                      : Icon(
                          Icons.bookmark_add_rounded,
                          color: Appcolors.white,
                        ),
                  onPressed: () {
                    if (localDataHelper.movies!.containsKey(widget.move.id)) {
                      localDataHelper.movies!.delete(widget.move.id);
                    } else {
                      localDataHelper.movies!.put(widget.move.id, widget.move);
                    }
                    context.read<MovieDetailesCubit>().refresh();
                  },
                );
              },
            ),
          ],
        ),

        body: BlocBuilder<MovieDetailesCubit, MovieDetailesState>(
          buildWhen: (previous, current) {
            return current is MovieDetailesLoading ||
                current is MovieDetailesSuccess ||
                current is MovieDetailesFailure;
          },
          builder: (context, state) {
            if (state is MovieDetailesLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is MovieDetailesSuccess) {
              var data = state.data;
              return Column(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Poster_Image(data: data, screenHeight: screenHeight),

                      backDropImage(
                        screenHeight: screenHeight,
                        screenWidth: screenWidth,
                        data: data,
                      ),

                      vote_Avarage(
                        screenHeight: screenHeight,
                        screenWidth: screenWidth,
                        data: data,
                      ),

                      video_title(
                        screenHeight: screenHeight,
                        screenWidth: screenWidth,
                        data: data,
                      ),
                    ],
                  ),

                  SizedBox(height: screenHeight * 0.08),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          customicon(
                            screenWidth: screenWidth,
                            icon: Icons.calendar_month,
                          ),
                          SizedBox(width: screenWidth * 0.01),
                          Text(
                            data.releaseDate.toString().split('-').first,
                            style: TextStyle(
                              color: Appcolors.grey,
                              fontSize: screenWidth * 0.04,
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.02),
                          VerticalDivider(color: Appcolors.grey, width: 1),
                          SizedBox(width: screenWidth * 0.02),

                          customicon(
                            screenWidth: screenWidth,
                            icon: Icons.access_time,
                          ),
                          SizedBox(width: screenWidth * 0.01),
                          Text(
                            data.runtime != null
                                ? "${data.runtime} min"
                                : 'N/A',
                            style: TextStyle(
                              color: Appcolors.grey,
                              fontSize: screenWidth * 0.04,
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.02),
                          VerticalDivider(color: Appcolors.grey, width: 1),
                          SizedBox(width: screenWidth * 0.02),
                          customicon(
                            screenWidth: screenWidth,
                            icon: Icons.confirmation_num_outlined,
                          ),
                          SizedBox(width: screenWidth * 0.01),
                          Text(
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            data.genres![0].name.toString(),
                            style: TextStyle(
                              color: Appcolors.grey,
                              fontSize: screenWidth * 0.04,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  //Main:====================================Custom tab bar
                  Movie_Detaile_TabBar(screenWidth: screenWidth),
                  Expanded(
                    //======================================custom Tab barView
                    child: TabBarView(
                      children: [
                        //overview===========================>
                        SingleChildScrollView(
                          padding: EdgeInsets.all(screenWidth * 0.04),
                          child: Text(
                            data.overview ?? 'No Overview Available',
                            style: TextStyle(
                              color: Appcolors.white,
                              fontSize: screenWidth * 0.04,
                            ),
                          ),
                        ),

                        //reviews===========================>
                        BlocProvider(
                          create: (context) =>
                              ReviewCubitCubit()
                                ..Get_REVIEW_DATA(widget.move.id.toString()),
                          child: BlocConsumer<ReviewCubitCubit, ReviewCubitState>(
                            listener: (context, state) {},
                            builder: (context, state) {
                              if (state is ReviewCubitLoading) {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              if (state is ReviewCubitSuccess) {
                                final reviews = state.Review_data.results ?? [];
                                if (reviews.isEmpty) {
                                  return Center(
                                    child: Text(
                                      'No Reviews Yet',
                                      style: TextStyle(
                                        color: Appcolors.white,
                                        fontSize: screenWidth * 0.045,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  );
                                }
                                return ListView.builder(
                                  itemCount: reviews.length,
                                  itemBuilder: (context, index) {
                                    final reviews =
                                        state.Review_data.results![index];
                                    return ListTile(
                                      leading: CircleAvatar(
                                        radius: 25,
                                        child:
                                            reviews.authorDetails!.avatarPath !=
                                                null
                                            ? ClipOval(
                                                child: Image.network(
                                                  width: 50,
                                                  height: 50,
                                                  "https://image.tmdb.org/t/p/w500${reviews.authorDetails!.avatarPath}",
                                                  fit: BoxFit.cover,
                                                ),
                                              )
                                            : Icon(
                                                Icons.person,
                                                color: Appcolors.white,
                                              ),
                                      ),
                                      title: Text(
                                        reviews.author.toString(),
                                        style: TextStyle(
                                          color: Appcolors.white,
                                          fontSize: screenWidth * 0.04,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      subtitle: Text(
                                        maxLines: 5,
                                        overflow: TextOverflow.ellipsis,
                                        reviews.content.toString(),
                                        style: TextStyle(
                                          color: Appcolors.grey,
                                          fontSize: screenWidth * 0.035,
                                        ),
                                      ),
                                    );
                                  },
                                );
                              }
                              return Container();
                            },
                          ),
                        ),

                        //cast===========================>
                        BlocProvider(
                          create: (context) =>
                              CastCubit()..Get_cast(widget.move.id.toString()),
                          child: BlocConsumer<CastCubit, CastState>(
                            listener: (context, state) {},
                            builder: (context, state) {
                              if (state is CastLoading) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              } else if (state is CastSuccess) {
                                var data = state.cast;
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 10,
                                  ),
                                  child: GridView.builder(
                                    itemCount: data.cast!.length,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          crossAxisSpacing: 10,
                                          mainAxisExtent: 150,
                                          childAspectRatio: 0.8,
                                        ),
                                    itemBuilder: (context, index) {
                                      var res = data.cast![index];

                                      return Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          CircleAvatar(
                                            radius: 45,
                                            backgroundColor: Colors.grey[800],
                                            backgroundImage:
                                                res.profilePath != null
                                                ? NetworkImage(
                                                    "https://image.tmdb.org/t/p/w500${res.profilePath}",
                                                  )
                                                : null,
                                            child: res.profilePath == null
                                                ? const Icon(
                                                    Icons.person,
                                                    size: 45,
                                                    color: Colors.white70,
                                                  )
                                                : null,
                                          ),
                                          const SizedBox(height: 8),
                                          Text(
                                            res.name ?? '',
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                );
                              }
                              return const SizedBox();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }
            if (state is MovieDetailesFailure) {
              return Center(child: Text(state.message.toString()));
            }

            return Container();
          },
        ),
      ),
    );
  }
}
