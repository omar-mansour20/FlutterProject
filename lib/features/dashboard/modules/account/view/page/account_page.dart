import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_reservation_project/features/dashboard/modules/account/controller/account_cubit.dart';
import 'package:hotel_reservation_project/features/dashboard/modules/account/view/component/account_widget.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AccountCubit(),
      child: BlocBuilder<AccountCubit, AccountState>(
        builder: (context, state) {
          final AccountCubit controller = context.read<AccountCubit>();
          //scaffold
          return Scaffold(
            //backgroundColor: Color.fromARGB(255, 45, 45, 45),
            body: state is AccountLoading
                ? const CircularProgressIndicator() // loading screen
                : state is AccountEmpty
                    ? const Center(
                        child: Icon(
                        CupertinoIcons
                            .delete, // icon of delete if state is empty
                        size: 100,
                        color: Colors.red,
                      ))
                    //else
                    : ListView.builder(
                        itemCount: controller.accounts.length,
                        itemBuilder: (_, int index) {
                          return AccountItemWidget(
                              accountModel: controller.accounts[index]);
                        }),
          );
        },
      ),
    );
  }
}
