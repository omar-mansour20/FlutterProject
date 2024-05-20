import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_reservation_project/features/dashboard/modules/home/model/repo/firebase_data.dart';
import 'package:hotel_reservation_project/features/dashboard/modules/home/model/home_model.dart';
import 'package:hotel_reservation_project/features/dashboard/modules/home/model/repo/home_local_db_data.dart';
import 'package:hotel_reservation_project/features/dashboard/modules/home/model/repo/parent_data.dart';
import 'package:path/path.dart';

class HotelCubit extends Cubit<HotelState> {
  HotelCubit() : super(HotelLoading()) {
    init();
  }

  List<HotelModel> hotels = [];

  Future<void> init() async {
    emit(HotelLoading());
    //hotels = await FirebaseRepo.instance.fetch()
    hotels = [
      await (await HotelDatabaseRepo.instance)
          .inserthotel(name: 'hotel1', description: 'desc', price: 2000)
    ];
    hotels = [
      await (await HotelDatabaseRepo.instance)
          .inserthotel(name: 'hotel2', description: 'desc1', price: 5000)
    ];

    hotels = await (await HotelDatabaseRepo.instance).fetch();
    if (hotels.isEmpty) {
      emit(HotelEmpty());
    } else {
      emit(HotelLoaded());
    }
  }
  // Future<FirebaseRepo> get instance_of_memory_object => FirebaseRepo.instance;
}

sealed class HotelState {}

// while fitching the data
final class HotelLoading extends HotelState {}

// after fitching the data
final class HotelLoaded extends HotelState {}

// if the data was empty
final class HotelEmpty extends HotelState {}
