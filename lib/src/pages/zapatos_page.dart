import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';
import 'package:shoesapp/src/helpers/connectivy.dart';
import 'package:shoesapp/src/helpers/helpers.dart';
import '../widgets/widgets.dart';

class ZapatosPage extends StatefulWidget {
  const ZapatosPage({super.key});

  @override
  State<ZapatosPage> createState() => _ZapatosPageState();
}

class _ZapatosPageState extends State<ZapatosPage> {
  late StreamSubscription subscription;

  @override
  void initState() {
    getConnectivy();
    super.initState();
  }

  getConnectivy() {
    final connectivyInternet =
        Provider.of<ConnectivyInternet>(context, listen: false);

    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) async {
      connectivyInternet.isDeviceConnected =
          await InternetConnectionChecker().hasConnection;
      if (!connectivyInternet.isDeviceConnected &&
          connectivyInternet.isAlertSet == false) {
        //_showToast();
        showDialogBox();
        connectivyInternet.isAlertSet = true;
      }
    });
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    cambiarStatusDark();
    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(title: 'For you'),
          const SizedBox(
            height: 20,
          ),
          Expanded(
              child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: const [
                Hero(tag: 'zapato-1', child: ZapatoSizePreview()),
                ZapatosDescription(
                  title: 'Nike Air Max 720',
                  description:
                      "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                ),
              ],
            ),
          )),
          AgregarCarritoBotom(monto: 100.00)
        ],
      ),
    );
  }

  _showToast() {
    final scaffold = ScaffoldMessenger.of(context);
    final connectivyInternet =
        Provider.of<ConnectivyInternet>(context, listen: false);

    scaffold.showSnackBar(SnackBar(
      content: Text('Sin connecciòn a internet'),
      action: SnackBarAction(
          label: 'Reintentar',
          onPressed: () async {
            connectivyInternet.isAlertSet = false;
            connectivyInternet.isDeviceConnected =
                await InternetConnectionChecker().hasConnection;
            if (!connectivyInternet.isDeviceConnected) {
              _showToast();
              connectivyInternet.isAlertSet = false;
            }
          }),
    ));
  }

  showDialogBox() {
    final connectivyInternet =
        Provider.of<ConnectivyInternet>(context, listen: false);

    return showCupertinoDialog(
        context: context,
        builder: (_) => CupertinoAlertDialog(
              title: const Text('No connection'),
              content: const Text('Checar conection a internet'),
              actions: [
                TextButton(
                    onPressed: () async {
                      Navigator.pop(context);
                      connectivyInternet.isAlertSet = false;
                      connectivyInternet.isDeviceConnected =
                          await InternetConnectionChecker().hasConnection;

                      if (!connectivyInternet.isDeviceConnected) {
                        showDialogBox();
                        connectivyInternet.isAlertSet = false;
                      }
                    },
                    child: const Text('Ok'))
              ],
            ));
  }
}
