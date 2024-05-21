
sealed class HotelState {}

// while fitching the data
final class HotelLoading extends HotelState {}

// after fitching the data
final class HotelLoaded extends HotelState {}

// if the data was empty
final class HotelEmpty extends HotelState {}
