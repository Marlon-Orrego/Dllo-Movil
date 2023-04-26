import 'package:flutter/material.dart';
import 'package:bankingapp/screens/movimientos/components/card_section.dart';
import 'package:bankingapp/screens/movimientos/components/recent_transactions.dart';
import 'package:bankingapp/screens/home/components/card.dart';

<<<<<<< HEAD
class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String selectedTransactionType = "TypeA";
  late Key _recentTransactionsKey;

  @override
  void initState() {
    selectedTransactionType = "TypeB";
    _recentTransactionsKey = ValueKey(selectedTransactionType);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
=======
class Body extends StatelessWidget {
  
  const Body({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
      late String selectedTransactionType;

>>>>>>> cc34b65a3334f5e62cc3c31d1bddc3959650cd49
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          CardSection(
            onTransactionTypeSelected: (String transactionType) {
<<<<<<< HEAD
              setState(() {
                selectedTransactionType = transactionType;
                _recentTransactionsKey = ValueKey(selectedTransactionType);
              });
=======
              //Aquí puedes hacer lo que quieras con el tipo de transacción seleccionado
              selectedTransactionType=transactionType;
>>>>>>> cc34b65a3334f5e62cc3c31d1bddc3959650cd49
            },
          ),
          SizedBox(
            height: 50,
<<<<<<< HEAD
          ),
=======
          ),   
>>>>>>> cc34b65a3334f5e62cc3c31d1bddc3959650cd49
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
<<<<<<< HEAD
          Expanded(
            child: RecentTransactionSectionM(
              key: _recentTransactionsKey,
              transactionType: selectedTransactionType,
            ),
          ),
=======
          RecentTransactionSectionM(transactionType: selectedTransactionType)
>>>>>>> cc34b65a3334f5e62cc3c31d1bddc3959650cd49
        ],
      ),
    );
  }
}
