import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hotel_reservation_project/features/dashboard/modules/account/model/account_model.dart';

class AccountItemWidget extends StatelessWidget {
  const AccountItemWidget({super.key, required this.accountModel});
  final AccountModel accountModel;
  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color:Color.fromARGB(255, 129, 184, 192),
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
            padding: const EdgeInsets.only(bottom: 20),
            child: Text(
              accountModel.address ?? 'no address',
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}



