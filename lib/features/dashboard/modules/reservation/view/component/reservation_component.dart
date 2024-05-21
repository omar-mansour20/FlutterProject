import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_reservation_project/core/validation.dart';
import 'package:hotel_reservation_project/features/dashboard/modules/home/view/page/home_page.dart';
import 'package:hotel_reservation_project/features/dashboard/modules/reservation/controller/Reservation_controller.dart';
import 'package:hotel_reservation_project/features/dashboard/modules/reservation/controller/Reservation_state.dart';
import 'package:path/path.dart';

class reservation_component extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: controller,
      child: BlocBuilder<ReservationController, ReservationState>(
        builder: (context, state) {
          ReservationController controller = context.read<
              ReservationController>();
          return Scaffold(
            appBar: AppBar(
              title: Text('Hotel Booking App'),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 200,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/hotel_splash.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Form(
                      key: controller.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Book the perfect hotel',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 16),
                          TextField(
                            controller: controller.name,
                            keyboardType: TextInputType.name,
                            decoration: const InputDecoration(
                              labelText: 'Name',
                              prefixIcon: Icon(Icons.hotel),
                            ),
                          ),
                          SizedBox(height: 16),
                          TextField(
                            controller: controller.description,
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                              labelText: 'Descreption',
                              prefixIcon: Icon(Icons.description),
                            ),
                          ),
                          SizedBox(height: 16),
                          TextField(
                            controller: controller.price,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              labelText: 'price',
                              prefixIcon: Icon(Icons.money),
                            ),
                          ),
                          SizedBox(height: 32),
                          TextField(
                            controller: controller.qntController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              labelText: 'Quantity',
                              prefixIcon: Icon(Icons.production_quantity_limits),
                            ),
                          ),
                          SizedBox(height: 32),
                          Row(
                            children: [
                          IconButton(onPressed: controller.pickproductImage, icon: const Icon(CupertinoIcons.photo)),
                          IconButton(onPressed: controller.takeproductImage, icon: const Icon(CupertinoIcons.camera)),
                            ],
                          ),
                          if(controller.image!=null)
                            ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child:Image.file(
                                File(controller.image!.path),
                                height: 200,
                                width: 200,
                                fit: BoxFit.cover,
                            ),
                            ),
                          ElevatedButton(
                            onPressed: () {
                              controller.addreservation(context);

                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                    'reservation'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  final ReservationController controller; // Change SomeControllerClass to the actual controller class
  const reservation_component({super.key, required this.controller});
}
/*
class reservation_component extends StatelessWidget {
// Change SomeControllerClass to the actual controller class

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: controller,
      child: BlocBuilder<ReservationController, ReservationState>(
        builder: (context, state) {
          ReservationController controller = context.read<ReservationController>();
          return Scaffold(
            appBar: AppBar(
              title: const Text('Hotel Booking App'),
            ),
            body: SingleChildScrollView(
                    child: Form(
                      key: controller.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Book the perfect hotel',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextField(
                            controller: controller.name,
                            keyboardType: TextInputType.name,
                            decoration: const InputDecoration(
                              labelText: 'Name',
                              prefixIcon: Icon(Icons.hotel),
                            ),
                          ),
                          SizedBox(height: 16),
                          TextField(
                            controller: controller.Desc,
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                              labelText: 'Descreption',
                              prefixIcon: Icon(Icons.description),
                            ),
                          ),
                          SizedBox(height: 16),
                          TextField(
                            controller: controller.price,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              labelText: 'price',
                              prefixIcon: Icon(Icons.money),
                            ),
                          ),
                          SizedBox(height: 32),
                          TextField(
                            controller: controller.qntController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              labelText: 'Quantity',
                              prefixIcon: Icon(Icons.production_quantity_limits),
                            ),
                          ),
                          SizedBox(height: 32),

                          Spacer(),
                          ElevatedButton(
                            onPressed: () {
                              controller.OnPressedConfirmButtom(context);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                    'reservation'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
          );
        },
      ),
    );
  }
  const reservation_component({super.key, required this.controller});
  final ReservationController controller;

}*/