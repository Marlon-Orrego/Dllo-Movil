import 'package:bankingapp/screens/movimientos/movimientos.dart';
import 'package:flutter/material.dart';
import 'item_action.dart';

class ActionItems extends StatelessWidget {
  const ActionItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 33),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ActionItem(
                  iconPath: "assets/icons/statistics.svg",
                  title: "Análisis",
                  press: () {},
                  navigate: (BuildContext context) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomeScreenMovimientos()),
                    );
                  },
                ),
                SizedBox(
                  width: 20,
                ),
                ActionItem(
                  iconPath: "assets/icons/payh.svg",
                  title: "Historial Gastos",
                  press: () {},
                  navigate: (BuildContext context) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomeScreenMovimientos()),
                    );
                  },
                ),
                SizedBox(
                  width: 20,
                ),
                ActionItem(
                  iconPath: "assets/icons/saves.svg",
                  title: "Ahorro",
                  press: () {},
                  navigate: (BuildContext context) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomeScreenMovimientos()),
                    );
                  },
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ActionItem(
                  iconPath: "assets/icons/pay.svg",
                  title: "Gestión Gastos",
                  press: () {},
                  navigate: (BuildContext context) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomeScreenMovimientos()),
                    );
                  },
                ),
              ],
            ),
          ],
        ));
  }
}
