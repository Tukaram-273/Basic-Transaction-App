import 'package:bankingsystem/model/customer.dart';
import 'package:bankingsystem/screens/adminDetails.dart';
import 'package:bankingsystem/screens/customers_list.dart';
import 'package:bankingsystem/screens/insertCustomer.dart';
import 'package:bankingsystem/widgets/customcard.dart';
import 'package:flutter/material.dart';
import '../dbHelper.dart';


class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Customer> query = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(39, 50, 80, 1),
      appBar: AppBar(backgroundColor: Colors.redAccent, title: Text('Basic Bank Transaction'),
      actions: <Widget>[
        IconButton(icon: Icon(Icons.info), onPressed: () async{
          DBHelper db =  DBHelper();
          query = await db.getCustomer();
          Navigator.of(context).pushNamed(AdminDetailsScreen.routeNamed, arguments: query[0]);

        })
      ],),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
                elevation: 5,
                margin: EdgeInsets.all(15),
                color: Colors.red.shade100,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                  topLeft : Radius.circular(10),
                  topRight : Radius.circular(10),),
                  child: Image(image: AssetImage("assets/images/logo.png"),
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.fill,
                  )),
              ),
              const Divider(
                color: Colors.lightBlue,
                height: 4,
                thickness: 4,
                endIndent: 0,
              ),
              Text(
                "Welome to the Basic Transaction App",
                style: TextStyle(
                  fontFamily: "Raleway",
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.red[600], 
                ),
              ),

              const Divider(
                color: Colors.lightBlue,
                height: 5,
                thickness: 4,
                endIndent: 0,
              ),
              SizedBox(height : 10),


              CustomCard(
                icon: Icons.account_circle,
                title: 'View All Customers',
                navpage: () async {
                  DBHelper db =  DBHelper();
                  query = await db.getCustomer();
                  Navigator.of(context).pushNamed(
                    CustomersList.routeNamed,
                    arguments: query
                    );
                },
              ),

              CustomCard(
                icon: Icons.account_balance_rounded,
                title: 'Insert Customer',
                navpage: () {
                  Navigator.of(context).pushNamed(
                    InsertCustomer.routeNamed,
                  );
                },
              ),
            ],
          ),
        ),

      ),
    );
  }
}