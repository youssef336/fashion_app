class CardEntity {
  String? cardNumber;
  String? cardHolderName;
  String? expiryDate;
  String? cvv;

  CardEntity({this.cardNumber, this.cardHolderName, this.expiryDate, this.cvv});
  CardEntity copyWith({
    String? cardNumber,
    String? cardHolderName,
    String? expiryDate,
    String? cvv,
  }) {
    return CardEntity(
      cardNumber: cardNumber ?? this.cardNumber,
      cardHolderName: cardHolderName ?? this.cardHolderName,
      expiryDate: expiryDate ?? this.expiryDate,
      cvv: cvv ?? this.cvv,
    );
  }

  static bool NotEmpty(CardEntity card) {
    return card.cardNumber != null &&
        card.cardHolderName != null &&
        card.expiryDate != null &&
        card.cvv != null;
  }
}
