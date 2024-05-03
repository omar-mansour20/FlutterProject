import 'package:flutter/material.dart';
import 'package:hotel_reservation_project/features/dashboard/modules/home/model/home_model.dart';


class HomeItemWidget extends StatelessWidget {
  const HomeItemWidget({super.key, required this.hotelModel});
  final HotelModel hotelModel;
  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            hotelModel.name ?? 'no name',
            style: const TextStyle(
              fontSize: 20,
              color: Colors.blue,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              hotelModel.address ?? 'no address',
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