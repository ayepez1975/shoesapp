import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoesapp/src/pages/zapato_desc_page.dart';
import 'package:shoesapp/src/provider/zapatos_provider.dart';

class ZapatoSizePreview extends StatelessWidget {
  final bool fullScreen;

  const ZapatoSizePreview({super.key, this.fullScreen = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!fullScreen) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => ZapatoDescPage()));
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: (fullScreen) ? 5 : 30, vertical: (fullScreen) ? 5 : 0),
        child: Container(
            width: double.infinity,
            height: (fullScreen) ? 420 : 440,
            decoration: BoxDecoration(
              color: Color(0xffFFCE55),
              borderRadius: (!fullScreen)
                  ? BorderRadius.circular(50)
                  : BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)),
            ),
            child: Column(
              children: [
                _ImageZapato(),
                if (!fullScreen) _TallasZapato(),
              ],
            )),
      ),
    );
  }
}

class _ImageZapato extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final zapatoProvider = Provider.of<ZapatoProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(40),
      child: Stack(
        children: [
          Positioned(
            bottom: 20,
            right: 0,
            child: _SombraZapato(),
          ),
          Image(
            image: AssetImage(zapatoProvider.assetImage),
          ),
        ],
      ),
    );
  }
}

class _SombraZapato extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.5,
      child: Container(
        width: 230,
        height: 120,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            boxShadow: [BoxShadow(color: Color(0xffEAA14E), blurRadius: 40)]),
      ),
    );
  }
}

class _TallasZapato extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _Talla(4),
          _Talla(5),
          _Talla(6.5),
          _Talla(8),
          _Talla(9),
        ],
      ),
    );
  }
}

class _Talla extends StatelessWidget {
  final double talla;

  const _Talla(this.talla);

  @override
  Widget build(BuildContext context) {
    final zapatoProvider = Provider.of<ZapatoProvider>(context);

    return GestureDetector(
      onTap: () {
        zapatoProvider.talla = talla;
        print(zapatoProvider.talla);
      },
      child: Container(
          alignment: Alignment.center,
          width: 50,
          height: 50,
          child: Text(
            talla.toString().replaceAll('.0', ''),
            style: TextStyle(
                color: (this.talla == zapatoProvider.talla)
                    ? Colors.white
                    : Color(0xfff1a23a),
                fontSize: 15,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          decoration: BoxDecoration(
            color: (this.talla == zapatoProvider.talla)
                ? Color(0xfff1a23a)
                : Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              if (this.talla == zapatoProvider.talla)
                BoxShadow(
                    color: Color(0xfff1a23a),
                    blurRadius: 10,
                    offset: Offset(0, 5))
            ],
          )),
    );
  }
}
