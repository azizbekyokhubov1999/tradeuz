import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/product_model.dart';

final _formKey = GlobalKey<FormState>();

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  TextEditingController productNameController = TextEditingController();
  TextEditingController productImageController = TextEditingController();
  TextEditingController productPriceController = TextEditingController();
  late SharedPreferences sharedPreferences;

  @override
  void initState() {
    super.initState();
    initalGetSavedData();
  }

  void initalGetSavedData() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  void storeData() {
    Product product = Product(
      name: productNameController.text,
      category: dropdownValue1.toLowerCase(),
      link: productImageController.text,
      price: productPriceController.text,
    );
    String productData = jsonEncode(product);
    print(productData);
    sharedPreferences.setString('productData', productData);
    Navigator.pop(context, product);
  }

  String dropdownValue1 = 'Kiyimlar';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Product",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 30),
          child: Column(
            children: [
              TextFormField(
                controller: productNameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  hintText: "Product Name",
                ),
                validator: (name) =>
                name!.isEmpty ? "Insert the Product name" : null,
              ),
              SizedBox(height: 30),
              TextFormField(
                controller: productImageController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  hintText: "Image link",
                ),
                validator: (username) =>
                username!.isEmpty ? "Insert the Image link" : null,
              ),
              SizedBox(height: 30),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
                style: const TextStyle(color: Colors.black38),
                value: dropdownValue1,
                icon: const Icon(Icons.keyboard_arrow_down),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue1 = newValue!;
                  });
                },
                items: const [
                  DropdownMenuItem(
                    value: "Kiyimlar",
                    child: Text(
                      "Kiyimlar",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  DropdownMenuItem(
                    value: "Texnika",
                    child: Text(
                      "Texnika",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  DropdownMenuItem(
                    value: "Erkaklar uchun",
                    child: Text(
                      "Erkaklar uchun",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  DropdownMenuItem(
                    value: "Ayollar uchun",
                    child: Text(
                      "Ayollar uchun",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  DropdownMenuItem(
                    value: "Bolalar uchun",
                    child: Text(
                      "Bolalar uchun",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  DropdownMenuItem(
                    value: "Oziq ovqatlar",
                    child: Text(
                      "Oziq ovqatlar",
                      style: TextStyle(color: Colors.black),
                    ),
                  )
                ],
              ),
              SizedBox(height: 30),
              TextFormField(
                enableSuggestions: false,
                keyboardType: TextInputType.number,
                controller: productPriceController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  hintText: "Price",
                ),
                validator: (price) => price!.isEmpty ? "Insert the price" : null,
              ),
              SizedBox(height: 30),
              MaterialButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    storeData();
                  }
                },
                color: Colors.grey,
                minWidth: double.infinity,
                height: 60,
                shape: RoundedRectangleBorder(
                    side: BorderSide.none,
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                  "Mahsulotni qo'shish",
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
