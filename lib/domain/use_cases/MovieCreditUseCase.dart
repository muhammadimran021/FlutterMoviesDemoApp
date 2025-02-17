import 'package:my_movie_app/data/models/CreditsRoodModel.dart';
import 'package:my_movie_app/data/repositories/MovieDetailRepository.dart';
import 'package:my_movie_app/domain/use_cases/BaseUseCase.dart';

class MovieCreditUseCase
    extends BaseUseCase<CreditsRoodModel, MovieCreditsParams> {
  final MovieDetailRepository repository;

  MovieCreditUseCase({required this.repository});

  @override
  Future<CreditsRoodModel> call(MovieCreditsParams params) {
    return repository.getMovieCredits(
        params.id, params.apiKey, params.language);
  }
}

class MovieCreditsParams {
  final String id;
  final String apiKey;
  final String language;

  MovieCreditsParams(
      {required this.id, required this.apiKey, required this.language});
}
