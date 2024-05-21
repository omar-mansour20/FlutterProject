import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_reservation_project/features/dashboard/modules/favorite/controller/Favorite_state.dart';
import 'package:hotel_reservation_project/features/dashboard/modules/home/controller/hotel_cubit.dart';
import 'package:hotel_reservation_project/features/dashboard/modules/home/controller/hotel_state.dart';
import 'package:hotel_reservation_project/features/dashboard/modules/home/model/repo/firebase_data.dart';
import 'package:hotel_reservation_project/features/dashboard/modules/home/model/home_model.dart';
import 'package:hotel_reservation_project/features/dashboard/modules/home/model/repo/home_local_db_data.dart';
import 'package:hotel_reservation_project/features/dashboard/modules/home/model/repo/parent_data.dart';

class FavoriteCubit extends Cubit<FavoriteState> {

  FavoriteCubit() : super(FavoriteLoading()) {
    init();
  }

  List<HotelModel> hotels = [];
  HotelDatabaseRepo repo=HotelDatabaseRepo();
  Future<void> init() async {
    emit(FavoriteLoading());
    //hotels = await FirebaseRepo.instance.fetch()

    hotels = await (await HotelDatabaseRepo.instance).fetchFavoriteHotels();
    if (hotels.isEmpty) {
      emit(FavoriteEmpty());
    } else {
      emit(FavoriteLoaded());
    }
  }
  Future<void> addToCart(int id,int value)
  async {
    await repo.updateFavorite(value, id);
    await init();
    await  HotelCubit.instance.init();
      emit(FavoriteLoaded());
  }
  void addCart(int id,int value)
  {
    repo.newQuantity(1, id);
    init();
    emit(FavoriteLoaded());
  }
  // Future<FirebaseRepo> get instance_of_memory_object => FirebaseRepo.instance;
}
