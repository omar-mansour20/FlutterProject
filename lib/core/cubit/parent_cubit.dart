import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_reservation_project/core/cubit/parent_state.dart';


class ParentCubit extends Cubit<ParentState>{
      static final ParentCubit instance=ParentCubit();
      ParentCubit():super(ParentStateInitial())
      {
            loadLanguage();
      }
      Map<String,dynamic>local={};
      Future <void> loadLanguage()async{
          String s=await  rootBundle.loadString('assets/lang/ar.json');
          local=json.decode(s);
          emit(ParentStateInitial());
      }
}