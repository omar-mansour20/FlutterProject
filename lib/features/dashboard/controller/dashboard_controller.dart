import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_reservation_project/features/dashboard/controller/dashboard_state.dart';

class dashboardController extends Cubit<dashboardState> {
  // dashboardController(super.initialState); 
  dashboardController() : super(dashBoardChangeState());

  int tapIndex=0;
  final PageController pageViewController = PageController();

  void onChangingTapIndex(int index){
    tapIndex = index;
    pageViewController.jumpToPage(tapIndex);
    emit(dashBoardChangeState());
  }

}