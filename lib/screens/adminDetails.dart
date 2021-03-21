import 'package:bankingsystem/model/customer.dart';
import 'package:bankingsystem/widgets/customcard.dart';
import 'package:flutter/material.dart';

class AdminDetailsScreen extends StatefulWidget {
  static const routeNamed = '/AdminDetails';

  @override
  _AdminDetailsScreenState createState() => _AdminDetailsScreenState();
}

class _AdminDetailsScreenState extends State<AdminDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var query = ModalRoute.of(context).settings.arguments  as Customer;
    return Scaffold(
      backgroundColor: Color.fromRGBO(39, 50, 80, 1),
      appBar: AppBar(backgroundColor: Colors.blue, title: Text("  User"),),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
           CircleAvatar(
             radius : 70,
             backgroundImage: AssetImage("assets/images/profilepic.png"),),
             Text(
               "User",
               style: TextStyle(
                 fontFamily: "Roboto",
                 fontSize: 40,
                 fontWeight: FontWeight.bold,
                 color: Colors.red[600],),
                ),
                const Divider(
                  color: Colors.black,
                  height: 20,
                  thickness: 5,
                  endIndent: 0,
                ),
                CustomCard(icon: Icons.account_box_outlined, title: 'Account No: ${query.id}',),
                CustomCard(icon: Icons.account_balance_wallet_sharp, title: 'Balance: Rs.${query.balance}',),
          ],
      ),
    ),);
  }
}