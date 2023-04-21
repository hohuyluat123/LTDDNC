//
// class Districts{
//   final String name;
//   final int code;
//   final String division_type;
//   final String codename;
//   final int phone_code;
//   late final List<DistrictName> districts;
//
//   Districts({
//     required this.name,
//     required this.code,
//     required this.division_type,
//     required this.codename,
//     required this.phone_code,
//     required this.districts,
//
//   });
//
//   factory Districts.fromJson(Map<String, dynamic> json) {
//     return Districts(
//       name: json['name'] as String,
//       code: json['code'] as int,
//       division_type: json['division_type'] as String,
//       codename: json['codename'] as String,
//       phone_code: json['phone_code'] as int,
//       districts: json['districts'] as List<DistrictName>,
//     );
//   }
//
//   static List<Districts> parseAddress(List<dynamic> responseBody) {
//     try {
//       List<Districts> listAddress = (responseBody)
//           .map((dynamic item) =>Districts.fromJson(item))
//           .toList();
//       return listAddress;
//     } catch (e) {
//       print(e);
//       return [];
//     }
//   }
// }
