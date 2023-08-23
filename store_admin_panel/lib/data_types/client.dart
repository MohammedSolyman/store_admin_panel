class Client {
  String displayName = '';
  String userId = '';
  String address = '';

  Client({
    required this.displayName,
    required this.userId,
    required this.address,
  });

  Client.fromMap(Map<String, dynamic> map) {
    displayName = map['displayName'];
    userId = map['userId'];
    address = map['address'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> m = {
      'displayName': displayName,
      'userId': userId,
      'address': address,
    };
    return m;
  }
}
