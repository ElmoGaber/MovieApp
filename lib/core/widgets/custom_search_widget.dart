import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:movie_app/core/model/moviemodel.dart';
import 'package:movie_app/core/theme/appColors.dart';

class custom_search_widget extends StatelessWidget {
  const custom_search_widget({
    super.key,
    required this.data,
    required this.genresMap,
    required this.runtimeType,
  });

  final List<MovieModel> data;
  final Map<int, String> genresMap;
  @override
  final Type runtimeType;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        var movie = data[index];
        //====================> Map genreIds to names
        List<String> genreNames = movie.genreIds
            .map((id) => genresMap[id] ?? 'Unknown')
            .toList();
        //=================> هنا الانواع بتاعت الفيلم
        String genresText = genreNames.join(', ');

        return Container(
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
              //  Movie poster
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  "https://image.tmdb.org/t/p/w500${movie.posterPath ?? ''}",
                  width: 100,
                  height: 140,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      Icon(Icons.broken_image, color: Appcolors.grey, size: 60),
                ),
              ),
              const SizedBox(width: 12),

              // Movie info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    //==================>title
                    Text(
                      movie.title,
                      style: TextStyle(
                        color: Appcolors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    const SizedBox(height: 6),
                    //===================>rate
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 20),
                        const SizedBox(width: 4),
                        Text(
                          movie.voteAverage.toString().substring(0, 3),
                          style: TextStyle(
                            color: Appcolors.white,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    //==================>genres names
                    Row(
                      children: [
                        Icon(
                          Icons.confirmation_num_outlined,
                          color: Appcolors.white,
                        ),
                        Gap(10),
                        Expanded(
                          child: Text(
                            //=================>اعرض بقي
                            genresText,
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
                          style: TextStyle(color: Appcolors.grey, fontSize: 13),
                        ),
                      ],
                    ),
                    Gap(10),
                    //we need to use runtime instead of this that is in movieDetailModel
                    Row(
                      children: [
                        Icon(Icons.access_time, color: Appcolors.white),
                        Gap(10),
                        Text(
                          movie.runtimeType.toString(),
                          style: TextStyle(color: Appcolors.grey, fontSize: 13),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
