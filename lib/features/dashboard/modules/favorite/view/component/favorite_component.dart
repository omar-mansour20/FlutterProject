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
             
            ),
          
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