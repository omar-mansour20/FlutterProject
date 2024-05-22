import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_reservation_project/features/dashboard/modules/cards/controller/Card_cubit.dart';
import 'package:hotel_reservation_project/features/dashboard/modules/favorite/controller/Favorite_cubit.dart';
import 'package:hotel_reservation_project/features/dashboard/modules/home/controller/hotel_cubit.dart';
import 'package:hotel_reservation_project/features/dashboard/modules/home/model/home_model.dart';
import 'package:hotel_reservation_project/features/dashboard/modules/home/view/page/home_page.dart';
import 'package:hotel_reservation_project/features/dashboard/modules/reservation/view/page/reservation_page.dart';
import 'package:hotel_reservation_project/features/dashboard/modules/home/model/repo/home_local_db_data.dart';
import 'package:hotel_reservation_project/features/dashboard/modules/home/model/home_model.dart';

class Card_component extends StatelessWidget {
  const Card_component({super.key, required this.hotelModel,required this.controller});
  final HotelModel hotelModel;
  final CardCubit controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: DecoratedBox(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10.0)),
        child:Padding(
          padding: const EdgeInsets.all(0),
          child:Column(
            children: [
              Row(
                children: [
                  Image.memory(hotelModel.image??Uint8List(5),
                    height: 200,
                    width: 200,
                    fit: BoxFit.cover,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(hotelModel.name ?? 'hotel',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color:  Colors.blue,
                        ),
                      ),
                      Text(hotelModel.descreption ?? 'desc' ,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color:  Colors.black,
                        ),
                      ),
                      Text(hotelModel.price.toString(),
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color:  Colors.black,
                        ),
                      ),

                    ],
                  ),
                  Spacer(),
                  Column(
                    children: [
                      Text((hotelModel.availableQuantity ??0).toString(),
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color:  Colors.blueGrey,
                        ),
                      ),
                    ],

                  ),
                ],
              ),
              Divider(
                thickness: .7,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  //like
                  Container(
                    height: 30,
                    width: 1.5,
                    color: Colors.grey,
                  ),
                  InkWell(child: hotelModel.availableQuantity ==1?
                  const Icon(
                    CupertinoIcons.bed_double_fill,
                    color: Colors.blue,)
                      :const Icon(CupertinoIcons.bed_double
                    ,color: Colors.grey,),
                    onTap: (){
                      if((hotelModel.availableQuantity)==1) {
                        controller.addCart(hotelModel.id?? 0,0);
                      }
                      else
                      {
                        controller.addCart(hotelModel.id??0,1);
                      }
                    },

                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}