import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_reservation_project/features/dashboard/modules/cards/controller/Card_state.dart';
import 'package:hotel_reservation_project/features/dashboard/modules/favorite/controller/Favorite_state.dart';
import 'package:hotel_reservation_project/features/dashboard/modules/home/controller/hotel_cubit.dart';
import 'package:hotel_reservation_project/features/dashboard/modules/home/controller/hotel_state.dart';
import 'package:hotel_reservation_project/features/dashboard/modules/home/model/repo/firebase_data.dart';
import 'package:hotel_reservation_project/features/dashboard/modules/home/model/home_model.dart';
import 'package:hotel_reservation_project/features/dashboard/modules/home/model/repo/home_local_db_data.dart';
import 'package:hotel_reservation_project/features/dashboard/modules/home/model/repo/parent_data.dart';

class CardCubit extends Cubit<CardState> {

  CardCubit() : super(CardLoading()) {
    init();
  }

  List<HotelModel> hotels = [];
  HotelDatabaseRepo repo=HotelDatabaseRepo();
  Future<void> init() async {
    emit(CardLoading());
    //hotels = await FirebaseRepo.instance.fetch()

    hotels = await (await HotelDatabaseRepo.instance).fetchCardHotels();
    if (hotels.isEmpty) {
      emit(CardEmpty());
    } else {
      emit(CardLoaded());
    }
  }
  Future<void> addToCart(int id,int value)
  async {
    await repo.updateFavorite(value, id);
    await init();
    await  HotelCubit.instance.init();
      emit(CardLoaded());
  }
  Future<void> addCart(int id,int value)
  async {
    await repo.newQuantity(value, id);
    await init();
    await  HotelCubit.instance.init();
    emit(CardLoaded());
  }
  // Future<FirebaseRepo> get instance_of_memory_object => FirebaseRepo.instance;
}
