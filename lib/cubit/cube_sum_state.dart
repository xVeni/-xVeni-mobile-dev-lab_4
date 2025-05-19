// Абстрактный базовый класс состояния
abstract class CubeSumState {}

// Начальное состояние (форма ввода)
class CubeSumInitial extends CubeSumState {}

// Состояние с результатом
class CubeSumResult extends CubeSumState {
  final int result;
  CubeSumResult(this.result);
}

// Состояние ошибки
class CubeSumError extends CubeSumState {
  final String message;
  CubeSumError(this.message);
}
