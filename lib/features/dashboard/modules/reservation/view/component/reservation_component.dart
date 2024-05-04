import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_reservation_project/core/validation.dart';
import 'package:hotel_reservation_project/features/dashboard/modules/reservation/controller/Reservation_controller.dart';
import 'package:hotel_reservation_project/features/dashboard/modules/reservation/controller/Reservation_state.dart';

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
                            controller: controller.DefinetionController,
                            keyboardType: TextInputType.streetAddress,
                            decoration: const InputDecoration(
                              labelText: 'Destination',
                              prefixIcon: Icon(Icons.location_on),
                            ),
                          ),
                          SizedBox(height: 16),
                          TextField(
                            controller: controller.DateController,
                            keyboardType: TextInputType.datetime,
                            decoration: const InputDecoration(
                              labelText: 'Date',
                              prefixIcon: Icon(Icons.calendar_today),
                            ),
                          ),
                          SizedBox(height: 16),
                          TextField(
                            controller: controller.NumController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: 'Number of Guests',
                              prefixIcon: Icon(Icons.group),
                            ),
                          ),
                          SizedBox(height: 32),
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