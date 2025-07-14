import 'package:bloc/bloc.dart';
import 'package:fashion/features/splash/domains/repo/pay_repo.dart';
import 'package:meta/meta.dart';

part 'pay_state.dart';

class PayCubit extends Cubit<PayState> {
  final PayRepo payRepo;
  PayCubit(this.payRepo) : super(PayInitial());

  void pay() async {
    final result = await payRepo.pay();
    result.fold((l) => emit(PayError(l.message)), (r) {
      var data = r["isPay"];
      emit(PaySuccess(data));
    });
  }
}
