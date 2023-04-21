class Order {
  final int orderId;
  final int status;
  final int product;
  final int account;
  final int seller;
  final int total;
  final int quantity;
  final bool isDelete;

  Order({
    required this.orderId,
    required this.status,
    required this.product,
    required this.account,
    required this.seller,
    required this.total,
    required this.quantity,
    required this.isDelete,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      orderId: json['orderId'] as int,
      status: json['status'] as int,
      product: json['product'] as int,
      account: json['account'] as int,
      seller: json['seller'] as int,
      total: json['total'] as int,
      quantity: json['quantity'] as int,
      isDelete: json['isDelete'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "orderId": orderId,
      "status": status,
      "product": product,
      "account": account,
      "seller": seller,
      "total": total,
      "quantity": quantity,
      "isDelete": isDelete,
    };
  }

  @override
  String toString() {
    return 'Order{orderId: $orderId, status: $status, product: $product, account: $account, seller: $seller, total: $total, quantity: $quantity, isDelete: $isDelete}';
  }

  static List<Order> parseOrders(List<dynamic> responseBody) {
    try {
      List<Order> listOrder = (responseBody)
          .map((dynamic item) => Order.fromJson(item))
          .toList();
      return listOrder;
    } catch (e) {
      print(e);
      return [];
    }
  }
}