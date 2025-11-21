import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_app/core/localDataHelper/localDataHelper.dart';
import 'package:movie_app/core/model/moviemodel.dart';
import 'package:movie_app/core/theme/appColors.dart';

class WatchList extends StatefulWidget {
  const WatchList({super.key});

  @override
  State<WatchList> createState() => _WatchListState();
}

class _WatchListState extends State<WatchList> {
  @override
  Widget build(BuildContext context) {
    var movies = (localDataHelper.movies!.values.toList()) as List<MovieModel>;

    return Scaffold(
      backgroundColor: Appcolors.ScaffoldCaller,
      body: SafeArea(
        child: movies.isNotEmpty
            ? ListView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  var movie = movies[index];

                  return GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          backgroundColor: Appcolors.ScaffoldCaller,
                          title: Text(
                            'alert'.tr(),
                            style: TextStyle(
                              color: Appcolors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                            ),
                          ),
                          content: Text(
                            'delete_Movie ?'.tr(),
                            style: TextStyle(
                              color: Appcolors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                            ),
                          ),
                          actions: [
                            ElevatedButton(
                              onPressed: () {
                                localDataHelper.movies!.delete(movie.id);
                                Navigator.pop(context);
                                setState(() {});
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red[400],
                              ),
                              child: Text(
                                'confirm'.tr(),
                                style: TextStyle(
                                  color: Appcolors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () => Navigator.pop(context),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                              ),
                              child: Text(
                                'cancel'.tr(),
                                style: TextStyle(
                                  color: Appcolors.grey,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      height: 180,
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        color: Colors.white10,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Poster
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.network(
                              "https://image.tmdb.org/t/p/w500${movie.posterPath ?? ''}",
                              width: 100,
                              height: 140,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  Icon(
                                    Icons.broken_image,
                                    color: Appcolors.grey,
                                    size: 60,
                                  ),
                            ),
                          ),
                          const SizedBox(width: 12),

                          // Movie info
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  movie.title,
                                  style: TextStyle(
                                    color: Appcolors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 6),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 20,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      movie.voteAverage.toString().substring(
                                        0,
                                        3,
                                      ),
                                      style: TextStyle(
                                        color: Appcolors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.confirmation_num_outlined,
                                      color: Appcolors.white,
                                    ),
                                    Gap(10),
                                    Expanded(
                                      child: Text(
                                        movie.genreIds.toString(),
                                        style: TextStyle(
                                          color: Appcolors.grey,
                                          fontSize: 13,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 6),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.calendar_month_rounded,
                                      color: Appcolors.white,
                                    ),
                                    Gap(10),
                                    Text(
                                      movie.releaseDate.split('-').first,
                                      style: TextStyle(
                                        color: Appcolors.grey,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ],
                                ),
                                Gap(10),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.access_time,
                                      color: Appcolors.white,
                                    ),
                                    Gap(10),
                                    Text(
                                      movie.runtimeType.toString(),
                                      style: TextStyle(
                                        color: Appcolors.grey,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )
            : Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.asset(
                        'assets/animation/Empty box.json',
                        height: 250,
                      ),
                      const Gap(20),
                      Text(
                        'no_result'.tr(),
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Appcolors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'no_data_message'.tr(),
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Appcolors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
