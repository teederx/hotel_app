part of 'card_cubit.dart';

class CardState {
  String cardNumber;
  String cardCVV;
  String? expiryDate;
  String? cardHolderName;

  CardState({
    required this.cardNumber,
    required this.cardCVV,
    this.cardHolderName,
    this.expiryDate,
  });
}
