class PromoCode {
  final String code;
  final String description;
  final int id;
  bool ontap;

  PromoCode({
    required this.id, 
    required this.code,
    required this.description,
    this.ontap = false,
  });
}
