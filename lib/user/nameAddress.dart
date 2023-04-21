
class AddressName{
  final String name;
  final int code;
  final String division_type;
  final String codename;
  final int phone_code;
  final List<dynamic> districts;

  AddressName({
    required this.name,
    required this.code,
    required this.division_type,
    required this.codename,
    required this.phone_code,
    required this.districts,

  });

  factory AddressName.fromJson(Map<String, dynamic> json) {
    return AddressName(
      name: json['name'] as String,
      code: json['code'] as int,
      division_type: json['division_type'] as String,
      codename: json['codename'] as String,
      phone_code: json['phone_code'] as int,
      districts: json['districts'] as List<dynamic>,
    );
  }

  static List<AddressName> parseAddress(List<dynamic> responseBody) {
    try {
      List<AddressName> listAddress = (responseBody)
          .map((dynamic item) =>AddressName.fromJson(item))
          .toList();
      return listAddress;
    } catch (e) {
      print(e);
      return [];
    }
  }
}
