import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/cubit/cart_cubit.dart';

import '../page/home_page.dart';

class AppWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CartCubit(),
      child: MaterialApp(
        theme: ThemeData(primarySwatch: Colors.red),
        home: HomePage(),
      ),
    );
  }
}
