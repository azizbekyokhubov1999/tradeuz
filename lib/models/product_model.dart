import 'dart:convert';

class Product{
  String name;
  String link;
  String category;
  String price;
 Product({required this.name, required this.category,required  this.link, required this.price});
 Product.fromJson(Map<String, dynamic> json) : name =json['name'], link = json['link'], category = json['category'], price = json['price'];
 Map<String, dynamic> toJson()=>{
   'name' : name,
  'link' : link,
  'category' : category,
  'price' : price
  };

}
