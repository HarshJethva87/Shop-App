import 'package:flutter/material.dart';
import 'package:shop_app/globle_variables.dart';
import 'package:shop_app/product_card.dart';
import 'package:shop_app/product_detail_page.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

final List<String> brandsFilter = [
  "All",
  "Adidas",
  "Nike",
  "Bata",
  "Puma",
  "Campus"
];

const border = OutlineInputBorder(
  borderSide: BorderSide(color: Colors.grey),
  borderRadius: BorderRadius.horizontal(
    left: Radius.circular(50),
  ),
);
late String selectedBrandFilter;

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  "Sohes\nCollection",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Search",
                    border: border,
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: brandsFilter.length,
              itemBuilder: (context, index) {
                final filters = brandsFilter[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedBrandFilter = filters;
                      });
                    },
                    child: Chip(
                      backgroundColor: selectedBrandFilter == filters
                          ? Colors.blueAccent
                          : Colors.transparent,
                      label: Text(
                        filters,
                        style: const TextStyle(fontSize: 16),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
              child: ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ProductDetailPage(product: product),
                    ));
                  },
                  child: ProductCard(
                    title: product['title'] as String,
                    price: product['price'] as double,
                    image: product['imageUrl'] as String,
                  ),
                ),
              );
            },
          ))
        ],
      ),
    );
  }
}
