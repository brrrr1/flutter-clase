import 'dart:convert';
import 'package:http/http.dart' as http;
import '../movie.dart';
import '../actor.dart';

class ApiService {
  static const String _apiKey = '13eb21937668110c8a2635cf3e82ae51';
  static const String _baseUrl = 'https://api.themoviedb.org/3';

  // Obtener actores populares
  Future<List<Actor>> fetchPopularActors() async {
    final response = await http.get(Uri.parse('$_baseUrl/person/popular?api_key=$_apiKey'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body)['results'] as List;
      return data.map((actor) => Actor.fromJson(actor)).toList();
    } else {
      throw Exception('Failed to load popular actors');
    }
  }

  // Obtener películas populares
  Future<List<Movie>> fetchPopularMovies() async {
    final response = await http.get(Uri.parse('$_baseUrl/movie/popular?api_key=$_apiKey'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body)['results'] as List;
      return data.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Failed to load popular movies');
    }
  }
}
