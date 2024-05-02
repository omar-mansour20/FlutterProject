import 'package:flutter/material.dart';
import 'package:hotel_reservation_project/features/dashboard/modules/account/model/account_model.dart';

class AccountItemWidget extends StatelessWidget {
  const AccountItemWidget({super.key, required this.accountModel});
  final AccountModel accountModel;
  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            accountModel.name ?? 'no name',
            style: const TextStyle(
              fontSize: 20,
              color: Colors.blue,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              accountModel.address ?? 'no address',
              style: const TextStyle(
                fontSize: 20,
                color: Colors.blue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}