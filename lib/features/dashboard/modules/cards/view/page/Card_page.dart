import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_reservation_project/features/dashboard/modules/cards/controller/Card_cubit.dart';
import 'package:hotel_reservation_project/features/dashboard/modules/cards/controller/Card_state.dart';
import 'package:hotel_reservation_project/features/dashboard/modules/cards/view/component/Card_component.dart';
import 'package:hotel_reservation_project/features/dashboard/modules/favorite/controller/Favorite_cubit.dart';
import 'package:hotel_reservation_project/features/dashboard/modules/favorite/controller/Favorite_state.dart';
import 'package:hotel_reservation_project/features/dashboard/modules/favorite/view/component/favorite_component.dart';
import 'package:hotel_reservation_project/features/dashboard/modules/home/controller/hotel_cubit.dart';
import 'package:hotel_reservation_project/features/dashboard/modules/home/controller/hotel_state.dart';
import 'package:hotel_reservation_project/features/dashboard/modules/home/view/components/Home_component.dart';
class CardPage extends StatelessWidget {
  const CardPage({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CardCubit(),
      child: BlocBuilder<CardCubit, CardState>(
          builder: (context,state){
            final CardCubit controller =context.read<CardCubit>();
            return Scaffold(
              body: State is HotelLoading?
              const CircularProgressIndicator():
              State is HotelEmpty?
              const Center(child: Icon(CupertinoIcons.delete,
                size: 50,
                color: Colors.blue,
              ),):
              ListView.builder(
                itemBuilder: (_,int index)=>Card_component(
                  hotelModel: controller.hotels[index], controller: controller,) ,
                itemCount: controller.hotels.length,
              ),
            );
          }
      ),
    );
  }
}
