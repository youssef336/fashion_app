part of 'pay_cubit.dart';

@immutable
abstract class PayState {}

class PayInitial extends PayState {}

class PaySuccess extends PayState {
  final bool ispaid;
  PaySuccess(this.ispaid);
}

class PayError extends PayState {
  final String message;
  PayError(this.message);
}
