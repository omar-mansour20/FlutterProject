
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_reservation_project/features/dashboard/modules/home/controller/hotel_cubit.dart';
import 'package:hotel_reservation_project/features/dashboard/modules/reservation/controller/Reservation_state.dart';
import 'package:image_picker/image_picker.dart';
import 'package:hotel_reservation_project/features/dashboard/modules/home/model/home_model.dart';
import 'package:hotel_reservation_project/features/dashboard/modules/home/model/repo/home_local_db_data.dart';
import 'package:hotel_reservation_project/features/dashboard/modules/home/model/repo/parent_data.dart';



class ReservationController extends Cubit<ReservationState>
{
  ReservationController() : super(ReservationInitial());
  TextEditingController name = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController qntController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  void OnPressedConfirmButtom(BuildContext context) {
    if (formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('successfully')),
      );
    }
  }
 XFile? image;
  Future<void> pickproductImage ()
  async {
    final ImagePicker picker = ImagePicker();
// Pick an image.
     image = await picker.pickImage(source: ImageSource.gallery);
    emit(ReservationInitial());

  }
  Future<void> takeproductImage()
  async {
    final ImagePicker picker = ImagePicker();
// Pick an image.
     image = await picker.pickImage(source: ImageSource.camera);
     emit(ReservationInitial());
  }

  Future<void> addreservation(context)
  async {
    HotelDatabaseRepo repo=HotelDatabaseRepo();
    repo.inserthotel(name: name.text,description:description.text,price:  int.parse(price.text),quantity:int.parse(qntController.text),availableQuantity: 0,image: await image!.readAsBytes(),);
    await HotelCubit.instance.init();
    Navigator.pop(context);
  }
}