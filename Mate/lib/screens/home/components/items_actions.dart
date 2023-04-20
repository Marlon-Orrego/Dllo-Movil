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
                ),
                SizedBox(
                  width: 20,
                ),
                ActionItem(
                  iconPath: "assets/icons/payh.svg",
                  title: "Historial Gastos",
                  press: () {},
                ),
                SizedBox(
                  width: 20,
                ),
                ActionItem(
                  iconPath: "assets/icons/saves.svg",
                  title: "Ahorro",
                  press: () {},
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
                ),
              ],
            ),
          ],
        ));
  }
}
