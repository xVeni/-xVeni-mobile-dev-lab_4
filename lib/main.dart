import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'screens/cube_screen.dart';
import 'cubit/cube_sum_cubit.dart';

void main() {
  runApp(const CubeSumApp());
}

class CubeSumApp extends StatelessWidget {
  const CubeSumApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab 4',
      home: BlocProvider(
        create: (_) => CubeSumCubit(),
        child: const CubeScreen(),
      ),
    );
  }
}
