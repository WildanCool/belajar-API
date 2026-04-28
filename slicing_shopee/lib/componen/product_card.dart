import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductCard extends StatelessWidget {
  final Map item;

  const ProductCard({super.key, required this.item});

  int getStar(double rating) {
    if (rating > 4.5) return 5;
    if (rating > 3.5) return 4;
    if (rating > 2.5) return 3;
    if (rating > 1.5) return 2;
    return 1;
  }

  @override
  Widget build(BuildContext context) {
    double rating = item['rating'];

    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                item['thumbnail'],
                fit: BoxFit.contain,
                width: double.infinity,
              ),
            ),
          ),

          SizedBox(height: 8),

          Text(
            item['title'],
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(height: 1.2),
          ),

          Row(
            children: [
              ...List.generate(5, (index) {
                return Icon(
                  index < getStar(rating) ? Icons.star : Icons.star_border,
                  color: Colors.orange,
                  size: 14,
                );
              }),
              SizedBox(width: 4),
              Text(
                rating.toStringAsFixed(1),
                style: TextStyle(fontSize: 12, color: Colors.grey[700]),
              ),
            ],
          ),

          Text(
            "Rp ${item['price']}",
            style: TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),

          SizedBox(height: 4),

          Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "Buy",
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 6),
              Expanded(
                flex: 1,
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    Icons.shopping_cart_outlined,
                    size: 20,
                    color: Colors.green,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
