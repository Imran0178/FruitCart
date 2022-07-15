class Product {
  String productName = '';
  String weight = '';
  String originalPrice = '';
  String offerPrice = '';
  String imagePath = '';
  String labelName = '';
  String freeLabel = '';
  int quantity = 0;

  Product(this.productName, this.weight, this.originalPrice, this.offerPrice,
      this.imagePath, this.labelName, this.freeLabel);

  Product.fromJson(Map<String, dynamic> json) {
    productName = json['productName'];
    weight = json['weight'];
    originalPrice = json['originalPrice'];
    offerPrice = json['offerPrice'];
    imagePath = json['imagePath'];
    labelName = json['labelName'];
    freeLabel = json['freeLabel'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productName'] = this.productName;
    data['weight'] = this.weight;
    data['originalPrice'] = this.originalPrice;
    data['offerPrice'] = this.offerPrice;
    data['imagePath'] = this.imagePath;
    data['labelName'] = this.labelName;
    data['freeLabel'] = this.freeLabel;

    return data;
  }
}
