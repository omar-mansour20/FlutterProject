import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_reservation_project/features/dashboard/modules/home/controller/hotel_cubit.dart';
import 'package:hotel_reservation_project/features/dashboard/modules/home/view/Component/home_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HotelCubit(),
      child: BlocBuilder<HotelCubit, HotelState>(
        builder: (context, state) {
          final HotelCubit controller = context.read<HotelCubit>();
          //scaffold
          return Scaffold(
            body: state is HotelLoading
                ? const CircularProgressIndicator()// loading screen
                : state is HotelEmpty
                    ? const Center(
                        child: Icon(
                        CupertinoIcons.delete, // icon of delete if state is empty
                        size: 100,
                        color: Colors.red,
                      )
                      )
                      //else
                    : ListView.builder( 
                        itemCount: controller.hotels.length,
                        itemBuilder: (_, int index) {
                          return HomeItemWidget(hotelModel: controller.hotels[index]);
                        }),
          );
        },
      ),
    );
  }
}