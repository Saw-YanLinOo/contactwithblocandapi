import 'package:contactwithblocandapi/bloc/get/cubit/getcontact_cubit.dart';
import 'package:contactwithblocandapi/data/locator.dart';
import 'package:contactwithblocandapi/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  locator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider<GetcontactCubit>(
        create: (_) => GetcontactCubit(getIt.call()),
        child: const Home(),
      ),
    );
  }
}
