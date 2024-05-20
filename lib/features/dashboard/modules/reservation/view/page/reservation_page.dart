import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_reservation_project/features/dashboard/modules/reservation/controller/Reservation_controller.dart';
import 'package:hotel_reservation_project/features/dashboard/modules/reservation/controller/Reservation_state.dart';
import 'package:hotel_reservation_project/features/dashboard/modules/reservation/view/component/reservation_component.dart';
class ReservationPage extends StatelessWidget {
  const ReservationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:BlocProvider<ReservationController>(
        create:(context) => ReservationController(),
    child:BlocBuilder<ReservationController, ReservationState>(
    builder: (context, state) {
    final ReservationController controller=context.read<ReservationController>();
    return Scaffold(
    body: reservation_component(controller:controller),
    );
    },
    ),
        ),
    );
  }
}