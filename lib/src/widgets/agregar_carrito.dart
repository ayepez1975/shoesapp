import 'package:flutter/material.dart';
import 'package:shoesapp/src/widgets/widgets.dart';

class AgregarCarritoBotom extends StatelessWidget {
  final double monto;

  const AgregarCarritoBotom({super.key, required this.monto});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(100)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              '\$${monto}',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            CustomButton(texto: 'Add to cart')
          ],
        ),
      ),
    );
  }
}
