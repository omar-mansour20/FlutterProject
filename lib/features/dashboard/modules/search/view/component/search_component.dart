import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class search_component extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 129, 184, 192),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Search Bar
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  hintText: 'Search for hotels...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  // Implement search functionality
                },
              ),
            ),
            // Featured Hotels
            _buildSectionTitle(context, 'Featured Hotels'),
            // Implement Featured Hotels widget
            // Hotel Categories
            _buildSectionTitle(context, 'Hotel Categories'),
            // Implement Hotel Categories widget
            // Recommended for You
            _buildSectionTitle(context, 'Recommended for You'),
            // Implement Recommended Hotels widget
            // Special Offers/Discounts
            _buildSectionTitle(context, 'Special Offers/Discounts'),
            // Implement Special Offers widget
          ],
        ),
      ),
    );
  }
}

Widget _buildSectionTitle(BuildContext context, String title) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Text(
      title,
      style: Theme.of(context).textTheme.headline6,
    ),
  );
}