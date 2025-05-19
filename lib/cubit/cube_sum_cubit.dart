import 'package:flutter_bloc/flutter_bloc.dart';
import 'cube_sum_state.dart';

// Класс управления состояниями
class CubeSumCubit extends Cubit<CubeSumState> {
  CubeSumCubit() : super(CubeSumInitial());

  // Метод расчёта куба суммы
  void calculate(String aStr, String bStr, bool isAgreed) {
    if (!isAgreed) {
      emit(CubeSumError("Вы должны согласиться на обработку данных."));
      return;
    }

    final int? a = int.tryParse(aStr);
    final int? b = int.tryParse(bStr);

    if (a == null || b == null) {
      emit(CubeSumError("Введите корректные числа."));
      return;
    }

    final result = (a + b) * (a + b) * (a + b); // (a + b)^3
    emit(CubeSumResult(result));
  }

  // Сброс к начальному состоянию
  void reset() {
    emit(CubeSumInitial());
  }
}
