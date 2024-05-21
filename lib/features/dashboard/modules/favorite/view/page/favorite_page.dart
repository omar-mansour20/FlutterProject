import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_reservation_project/features/dashboard/modules/favorite/controller/Favorite_cubit.dart';
import 'package:hotel_reservation_project/features/dashboard/modules/favorite/controller/Favorite_state.dart';
import 'package:hotel_reservation_project/features/dashboard/modules/favorite/view/component/favorite_component.dart';
import 'package:hotel_reservation_project/features/dashboard/modules/home/controller/hotel_cubit.dart';
import 'package:hotel_reservation_project/features/dashboard/modules/home/controller/hotel_state.dart';
import 'package:hotel_reservation_project/features/dashboard/modules/home/view/components/Home_component.dart';
class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoriteCubit(),
      child: BlocBuilder<FavoriteCubit, FavoriteState>(
          builder: (context,state){
            final FavoriteCubit controller =context.read<FavoriteCubit>();
            return Scaffold(
              body: State is HotelLoading?
              const CircularProgressIndicator():
              State is HotelEmpty?
              const Center(child: Icon(CupertinoIcons.delete,
                size: 50,
                color: Colors.blue,
              ),):
              ListView.builder(
                itemBuilder: (_,int index)=>Favorite_component(
                  hotelModel: controller.hotels[index], controller: controller,) ,
                itemCount: controller.hotels.length,
              ),

            );
          }
      ),
    );
  }
}
