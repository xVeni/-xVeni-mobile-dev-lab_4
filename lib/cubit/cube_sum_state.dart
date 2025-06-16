// cube_sum_state.dart

// Абстрактный базовый класс состояния
abstract class CubeSumState {}

// Начальное состояние (форма ввода)
class CubeSumInitial extends CubeSumState {}

// Состояние с результатом
class CubeSumResult extends CubeSumState {
  final int a;
  final int b;
  final int result;
  CubeSumResult({
    required this.a,
    required this.b,
    required this.result,
  });
}

// Состояние ошибки
class CubeSumError extends CubeSumState {
  final String message;
  CubeSumError(this.message);
}
