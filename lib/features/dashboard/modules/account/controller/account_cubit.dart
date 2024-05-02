import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:hotel_reservation_project/features/dashboard/modules/account/model/repo/local_db_data.dart';
import 'package:hotel_reservation_project/features/dashboard/modules/account/model/account_model.dart';


class AccountCubit extends Cubit<AccountState> {
  AccountCubit() : super(AccountLoading()) {
    init();
  }

  List<AccountModel> accounts = [];
  Future<void> init() async { 
    emit(AccountLoading());
    accounts = await (await DatabaseRepo.instance_of_memory_object).fetch();
    //accounts = await FirebaseRepo.instance.fetch();
    if (accounts.isEmpty) {
      emit(AccountEmpty());
    } else {
      emit(AccountLoaded());
    }
  }

  Future<DatabaseRepo> get instance_of_memory_object => DatabaseRepo.instance_of_memory_object;
}

sealed class AccountState {}

// while fitching the data
final class AccountLoading extends AccountState {}

// after fitching the data
final class AccountLoaded extends AccountState {}

// if the data was empty
final class AccountEmpty extends AccountState {}