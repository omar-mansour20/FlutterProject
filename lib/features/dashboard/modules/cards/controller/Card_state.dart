
sealed class CardState {}

// while fitching the data
final class CardLoading extends CardState {}

// after fitching the data
final class CardLoaded extends CardState {}

// if the data was empty
final class CardEmpty extends CardState {}
