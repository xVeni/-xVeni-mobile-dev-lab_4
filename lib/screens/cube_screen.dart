import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/cube_sum_cubit.dart';
import '../cubit/cube_sum_state.dart';

class CubeScreen extends StatefulWidget {
  const CubeScreen({super.key});

  @override
  State<CubeScreen> createState() => _CubeScreenState();
}

class _CubeScreenState extends State<CubeScreen> {
  final _aController = TextEditingController();
  final _bController = TextEditingController();
  bool _isAgreed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Калькулятор куба суммы")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocConsumer<CubeSumCubit, CubeSumState>(
          listener: (context, state) {
            if (state is CubeSumError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            }
          },
          builder: (context, state) {
            if (state is CubeSumInitial || state is CubeSumError) {
              return Column(
                children: [
                  TextField(
                    controller: _aController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: "Число A"),
                  ),
                  TextField(
                    controller: _bController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: "Число B"),
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: _isAgreed,
                        onChanged: (value) {
                          setState(() {
                            _isAgreed = value ?? false;
                          });
                        },
                      ),
                      const Text("Согласие на обработку данных")
                    ],
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      context.read<CubeSumCubit>().calculate(
                            _aController.text,
                            _bController.text,
                            _isAgreed,
                          );
                    },
                    child: const Text("Рассчитать"),
                  )
                ],
              );
            } else if (state is CubeSumResult) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Результат: ${state.result}",
                    style: const TextStyle(fontSize: 24),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      _aController.clear();
                      _bController.clear();
                      _isAgreed = false;
                      context.read<CubeSumCubit>().reset();
                    },
                    child: const Text("Новый расчёт"),
                  )
                ],
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
