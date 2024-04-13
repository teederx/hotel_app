import 'package:bloc/bloc.dart';
import 'package:hotel_app/data/model/promo_code.dart';

part 'promo_code_state.dart';

List<PromoCode> _promoCodes = [
  PromoCode(
    code: 'VAC25',
    description: 'Get 25% off on min booking of Rs.15000',
    id: 1,
  ),
  PromoCode(
    code: 'VAC10',
    description: 'Get 10% off on min booking of Rs.10000',
    id: 2,
  ),
  PromoCode(
    code: 'VAC30',
    description: 'Get 30% off on min booking of Rs.25000',
    id: 3,
  ),
  PromoCode(
    code: 'VAC5',
    description: 'Get 5% off on min booking of Rs.5000',
    id: 4,
  ),
];

List<PromoCode> _oldPromoCodes = [
  PromoCode(
    code: 'VAC25',
    description: 'Get 25% off on min booking of Rs.15000',
    id: 1,
  ),
  PromoCode(
    code: 'VAC10',
    description: 'Get 10% off on min booking of Rs.10000',
    id: 2,
  ),
  PromoCode(
    code: 'VAC30',
    description: 'Get 30% off on min booking of Rs.25000',
    id: 3,
  ),
  PromoCode(
    code: 'VAC5',
    description: 'Get 5% off on min booking of Rs.5000',
    id: 4,
  ),
];


class PromoCodeCubit extends Cubit<PromoCodeState> {
  PromoCodeCubit() : super(PromoCodeState(promocodes: _promoCodes));


  void codesList() => emit(state);
  void usedCode({required PromoCode promoCode}) {
    _promoCodes.remove(
      _promoCodes.firstWhere((element) => element.id == promoCode.id),
    );
    emit(
      PromoCodeState(
        promocodes: _promoCodes,
      ),
    );
  }
}
