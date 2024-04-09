import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';

part 'card_state.dart';

class CardCubit extends Cubit<CardState> {
  CardCubit() : super(CardState(cardNumber: '', cardCVV: ''));

  void onEditComplete({
    required String cardNumber,
    required String cardCVV,
    String? expiryDate,
    String? cardHolderName,
  }) =>
      emit(
        CardState(
          cardNumber: cardNumber,
          cardCVV: cardCVV,
          expiryDate: expiryDate,
          cardHolderName: cardHolderName,
        ),
      );
  void clear() => emit(
        CardState(
          cardNumber: '',
          cardCVV: '',
          expiryDate: '',
          cardHolderName: '',
        ),
      );
}
