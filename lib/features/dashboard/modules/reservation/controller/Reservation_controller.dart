
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_reservation_project/features/dashboard/modules/reservation/controller/Reservation_state.dart';



class ReservationController extends Cubit<ReservationState>
{
  ReservationController() : super(ReservationInitial());
  TextEditingController DefinetionController = TextEditingController();
  TextEditingController DateController = TextEditingController();
  TextEditingController NumController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  void OnPressedConfirmButtom(BuildContext context) {
    if (formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('successfully')),
      );
    }
  }
}