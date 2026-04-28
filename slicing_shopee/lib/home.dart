import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:slicing_shopee/componen/pilihan.dart';
import 'package:slicing_shopee/componen/product_card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List data = [];
  bool isLoading = true;

  Future ambilData() async {
    var response = await http.get(Uri.parse('https://dummyjson.com/products'));

    if (response.statusCode == 200) {
      var hasil = jsonDecode(response.body);
      setState(() {
        data = hasil['products'];
        isLoading = false;
      });
    } else {
      throw Exception('Gagal Ambil Data');
    }
  }

  @override
  void initState() {
    super.initState();
    ambilData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.black.withOpacity(0.3),
        elevation: 0,

        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.chat_bubble_outline, color: Colors.white),
            onPressed: () {},
          ),
        ],

        title: Container(
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Row(
            children: [
              SizedBox(width: 10),
              Icon(Icons.search, color: Colors.grey),

              SizedBox(width: 8),
              Text("Cari", style: TextStyle(color: Colors.grey)),

              Spacer(),

              Icon(Icons.camera_alt, color: Colors.grey),
              SizedBox(width: 10),
            ],
          ),
        ),

        flexibleSpace: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/bg-appbar.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(color: Colors.black.withOpacity(0.3)),
        ),
      ),

      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Pilihan(),
                Expanded(
                  child: GridView.builder(
                    itemCount: data.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.65,
                    ),
                    itemBuilder: (context, index) {
                      return ProductCard(item: data[index]);
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
