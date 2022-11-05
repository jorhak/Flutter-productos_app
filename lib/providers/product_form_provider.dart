import 'package:flutter/material.dart';
import 'package:productos_app/models/models.dart';

class ProductFromProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Product product;

  ProductFromProvider(this.product);

  bool isValidForm() {
    print(product.name);
    print(product.price);
    print(product.available);
    return formKey.currentState?.validate() ?? false;
  }

  updateAvailability(bool value) {
    print(value);
    product.available = value;
    notifyListeners();
  }
}
