import 'package:flutter/material.dart';
import 'package:bankingapp/screens/movimientos/components/card_section.dart';
import 'package:bankingapp/screens/movimientos/components/recent_transactions.dart';
import 'package:bankingapp/screens/home/components/card.dart';

class Body extends StatelessWidget {
  
  const Body({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
      late String selectedTransactionType;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          CardSection(
            onTransactionTypeSelected: (String transactionType) {
              //Aquí puedes hacer lo que quieras con el tipo de transacción seleccionado
              selectedTransactionType=transactionType;
            },
          ),
          SizedBox(
            height: 50,
          ),   
          Center(
            child: Text(
              'Transacciones Recientes',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
                color: Colors.black,
              ),
            ),
          ),
          RecentTransactionSectionM(transactionType: selectedTransactionType)
        ],
      ),
    );
  }
}
