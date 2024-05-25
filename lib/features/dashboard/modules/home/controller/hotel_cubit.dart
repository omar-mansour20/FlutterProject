import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_reservation_project/features/dashboard/modules/home/controller/hotel_state.dart';
import 'package:hotel_reservation_project/features/dashboard/modules/home/model/repo/firebase_data.dart';
import 'package:hotel_reservation_project/features/dashboard/modules/home/model/home_model.dart';
import 'package:hotel_reservation_project/features/dashboard/modules/home/model/repo/home_local_db_data.dart';
import 'package:hotel_reservation_project/features/dashboard/modules/home/model/repo/parent_data.dart';

class HotelCubit extends Cubit<HotelState> {

  static HotelCubit instance =HotelCubit();
  HotelCubit() : super(HotelLoading()) {
    init();
  }

  List<HotelModel> hotels = [];
  HotelDatabaseRepo repo=HotelDatabaseRepo();
  Future<void> init() async {
    emit(HotelLoading());
    //hotels = await FirebaseRepo.instance.fetch()

    hotels = await (await HotelDatabaseRepo.instance).fetch();
    if (hotels.isEmpty) {
      emit(HotelEmpty());
    } else {
      emit(HotelLoaded());
    }
  }
  Future<void> addToCart(int id,int value)
  async {
    await repo.updateFavorite(value, id);
    await init();
      emit(HotelLoaded());
  }
  Future<void> addCart(int id,int value)
  async {
   await repo.newQuantity(value, id); 
    await init();
      emit(HotelLoaded());
  }
  // Future<FirebaseRepo> get instance_of_memory_object => FirebaseRepo.instance;
}
