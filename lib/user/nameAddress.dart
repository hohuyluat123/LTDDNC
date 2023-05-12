
class AddressName {
  final String name;
  final int code;

  AddressName({
    required this.name,
    required this.code,
  });

  factory AddressName.fromJson(Map<String, dynamic> json) {
    return AddressName(
      name: json['name'] as String,
      code: json['code'] as int,
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
