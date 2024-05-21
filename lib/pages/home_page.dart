import 'package:flutter/material.dart';
import 'package:tradeuz/data/product_data.dart';
import '../models/product_model.dart';
import 'add_product_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

TextEditingController searchController = TextEditingController();
String dropdownValue = 'Kiyimlar';
String dropdownPrice = 'Eng arzonlari';

class _HomePageState extends State<HomePage> {
  static List<Product> products = [
    Product(
        name: "Polo futbolka",
        link:
        "https://cdn.britannica.com/22/187222-050-07B17FB6/apples-on-a-tree-branch.jpg",
        category: "Kiyimlar",
        price: "300000"),
    Product(
        name: "Polo mayka",
        link:
        "https://image.spreadshirtmedia.com/image-server/v1/products/T1412A1PA3703PT17X248Y10D1009682167W6181H8000/views/1,width=550,height=550,appearanceId=1,backgroundColor=F2F2F2,modelId=4100,crop=detail.jpg",
        category: "Kiyimlar",
        price: "300000"),
    Product(
        name: "Polo shim",
        link:
        "https://cdn.britannica.com/22/187222-050-07B17FB6/apples-on-a-tree-branch.jpg",
        category: "Kiyimlar",
        price: "40000"),
  ];

  List<Product> filteredProducts = products;

  @override
  void initState() {
    super.initState();
    filteredProducts = products;
  }

  void addProduct(Product product) {
    setState(() {
      products.add(product);
      filteredProducts = products;
    });
  }

  void searchProducts(String searchString) {
    List<Product> result = [];
    if (searchString.isEmpty) {
      result = products;
    } else {
      result = products
          .where((element) =>
          element.name.toLowerCase().contains(searchString.toLowerCase()))
          .toList();
    }
    setState(() {
      filteredProducts = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            "trade.uz",
            style: TextStyle(
                fontSize: 30,
                color: Colors.black,
                fontWeight: FontWeight.w800,
                fontFamily: 'Inter'),
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newProduct = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddProductPage()),
          );
          if (newProduct != null && newProduct is Product) {
            addProduct(newProduct);
          }
        },
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          children: [
            TextField(
              onChanged: (enteredValue) {
                searchProducts(enteredValue);
              },
              controller: searchController,
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    width: 1,
                  ),
                ),
                hintText: "Search",
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              height: 120,
              decoration: BoxDecoration(
                  color: const Color(0xffD8D8D8),
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Saralash",
                      style: TextStyle(
                          fontSize: 23, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.black, width: 1)),
                        width: 150,
                        height: 50,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: DropdownButtonFormField<String>(
                            style: const TextStyle(color: Colors.black38),
                            value: dropdownValue,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownValue = newValue!;
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
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.black, width: 1)),
                        width: 150,
                        height: 50,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: DropdownButtonFormField<String>(
                            style: const TextStyle(color: Colors.black),
                            value: dropdownPrice,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            onChanged: (String? newPrice) {
                              setState(() {
                                dropdownPrice = newPrice!;
                              });
                            },
                            items: const [
                              DropdownMenuItem(
                                value: "Eng arzonlari",
                                child: Text(
                                  "Eng arzonlari",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                              DropdownMenuItem(
                                value: "Eng qimmatlari",
                                child: Text("Eng qimmatlari"),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filteredProducts.length,
                itemBuilder: (_, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color(0xffD8D8D8),
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          SizedBox(
                            height: 120,
                            width: 150,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.network(
                                filteredProducts[index].link,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 40,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                filteredProducts[index].name,
                                style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(filteredProducts[index].category),
                              Text("${filteredProducts[index].price} so'm"),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
