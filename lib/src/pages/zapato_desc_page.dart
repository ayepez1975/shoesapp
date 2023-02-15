import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoesapp/src/helpers/helpers.dart';
import 'package:shoesapp/src/provider/zapatos_provider.dart';
import 'package:shoesapp/src/widgets/widgets.dart';

class ZapatoDescPage extends StatelessWidget {
  const ZapatoDescPage({super.key});

  @override
  Widget build(BuildContext context) {
    cambiarStatusLight();
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Hero(
                tag: 'zapato-1',
                child: ZapatoSizePreview(
                  fullScreen: true,
                ),
              ),
              Positioned(
                top: 60,
                left: 30,
                child: FloatingActionButton(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  highlightElevation: 0,
                  onPressed: () {
                    cambiarStatusDark();
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white.withOpacity(0.7),
                    size: 60,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
              child: Column(
            children: [
              ZapatosDescription(
                  title: 'Nike Air Max 720',
                  description:
                      "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so."),
              _BuyNow(),
              _ColorsMore(),
              _FooterShoes(),
            ],
          ))
        ],
      ),
    );
  }
}

class _FooterShoes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30),
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _ButtonShoesFooter(
            icon: Icons.star,
            color: Colors.red,
          ),
          _ButtonShoesFooter(
            icon: Icons.add_shopping_cart_sharp,
            color: Colors.grey.withOpacity(0.4),
          ),
          _ButtonShoesFooter(
            icon: Icons.settings,
            color: Colors.grey.withOpacity(0.4),
          )
        ],
      ),
    );
  }
}

class _ButtonShoesFooter extends StatelessWidget {
  final IconData icon;
  final Color color;

  const _ButtonShoesFooter({required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 45,
      decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
        BoxShadow(
            color: Colors.black26,
            spreadRadius: -5,
            blurRadius: 20,
            offset: Offset(0, 10))
      ]),
      child: Icon(
        icon,
        color: color,
        size: 40,
      ),
    );
  }
}

class _ColorsMore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
              child: Stack(
            children: const [
              Positioned(
                child: _MiniButton(
                  color: Color(0xff44555C),
                  index: 4,
                  image: 'assets/images/negro.png',
                ),
                left: 90,
              ),
              Positioned(
                child: _MiniButton(
                  color: Color(0xff40A5F2),
                  index: 3,
                  image: 'assets/images/azul.png',
                ),
                left: 60,
              ),
              Positioned(
                child: _MiniButton(
                  color: Color(0xffFFAB06),
                  index: 2,
                  image: 'assets/images/amarillo.png',
                ),
                left: 30,
              ),
              _MiniButton(
                color: Color(0xffCEDE34),
                index: 1,
                image: 'assets/images/verde.png',
              ),
            ],
          )),
          CustomButton(
            texto: 'More related items',
            alto: 35,
            ancho: 180,
            color: Color(0xffFBD797),
          )
        ],
      ),
    );
  }
}

class _MiniButton extends StatelessWidget {
  final Color color;
  final int index;
  final String image;

  const _MiniButton(
      {required this.color, required this.index, required this.image});

  @override
  Widget build(BuildContext context) {
    final zapatoProvider = Provider.of<ZapatoProvider>(context, listen: false);

    return FadeInLeft(
      delay: Duration(milliseconds: this.index * 100),
      duration: Duration(milliseconds: 300),
      child: GestureDetector(
        onTap: () {
          zapatoProvider.assetImage = image;
        },
        child: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ),
    );
  }
}

class _BuyNow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 120,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Text(
          '\$100',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        Bounce(
            delay: Duration(seconds: 1),
            from: 8,
            child: CustomButton(alto: 40, ancho: 120, texto: 'Buy now'))
      ]),
    );
  }
}
