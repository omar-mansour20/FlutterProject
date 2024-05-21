
sealed class FavoriteState {}

// while fitching the data
final class FavoriteLoading extends FavoriteState {}

// after fitching the data
final class FavoriteLoaded extends FavoriteState {}

// if the data was empty
final class FavoriteEmpty extends FavoriteState {}
