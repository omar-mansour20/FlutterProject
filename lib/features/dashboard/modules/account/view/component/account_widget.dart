import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hotel_reservation_project/features/dashboard/modules/account/model/account_model.dart';

class AccountItemWidget extends StatelessWidget {
  const AccountItemWidget({super.key, required this.accountModel});
  final AccountModel accountModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color:Color.fromARGB(255, 129, 184, 192),
          border: Border.all(color: Colors.black,width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                accountModel.id ?? 'no id',
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              Text(
                accountModel.name ?? 'no name',
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 1),
                child: Text(
                  accountModel.email ?? 'no email',
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



