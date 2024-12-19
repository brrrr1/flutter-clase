import 'package:flutter/material.dart';
import '../api_service.dart';
import '../movie.dart';

class MoviesScreen extends StatelessWidget {
  final ApiService apiService = ApiService();

  MoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: FutureBuilder<List<Movie>>(
        future: apiService.fetchPopularMovies(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: snapshot.data!.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final movie = snapshot.data![index];
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 3,
                child: ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      'https://image.tmdb.org/t/p/w200${movie.posterPath}',
                      width: 50,
                      height: 75,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(movie.title,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text('Movie ID: ${movie.id}'),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
