class WardName{
  final String name;
  final int code;
  final String division_type;
  final String codename;
  final int district_code;
  // final List<AddressName> wards;

  WardName({
    required this.name,
    required this.code,
    required this.division_type,
    required this.codename,
    required this.district_code,
    // required this.wards

  });

  factory WardName.fromJson(Map<String, dynamic> json) {
    return WardName(
      name: json['name'] as String,
      code: json['code'] as int,
      division_type: json['division_type'] as String,
      codename: json['codename'] as String,
      district_code: json['district_code'] as int,
      // wards: json['wards'] as List<AddressName>
    );
  }

  static List<WardName> parseAddress(List<dynamic> responseBody) {
    try {
      List<WardName> listAddress = (responseBody)
          .map((dynamic item) =>WardName.fromJson(item))
          .toList();
      return listAddress;
    } catch (e) {
      print(e);
      return [];
    }
  }
}
