import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp.hash());
}

class MyApp extends StatefulWidget {
  const MyApp.hash({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Application name
      title: 'My Flutter App',
      debugShowCheckedModeBanner: false, // Remove debug banner
      home:

          ///should be cut out from here
          Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),

          toolbarHeight: 70,
          centerTitle: true,
          backgroundColor: const Color(0xFFACAFF2),
          // The title text which will be shown on the action bar
          title: Row(
            children: [
              Image.asset(
                'images/Icon awesome-gem.png',
              ),
              Container(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  'Gem Details',
                  style: TextStyle(
                    fontSize: 31,
                    color: Colors.indigo,
                  ),
                ),
              )
            ],
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Row(
                  children: [
                    ///Gem picture
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(left: 20),
                        height: 150,
                        width: double.infinity,
                        color: Color(0xDBD6EFFF),
                        child: Image.asset('images/d1.png'),
                      ),
                    ),

                    ///gem pic end
                    ///qr
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(left: 20),
                        height: 150,
                        width: double.infinity,
                        color: Color(0xDBD6EFFF),
                        child: Image.asset('images/d1.png'),
                      ),
                    ),

                    ///qr end
                  ],
                ),

                ///gem code
                Container(
                  padding: EdgeInsets.only(left: 20),
                  height: 60,
                  width: double.infinity,
                  color: Color(0xD1D3FCFF),
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          'Gem Code :',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 22,
                            height: 2,
                          ),
                        ),
                      ),

                      ///place the gemcode variable here
                      Expanded(
                        child: Text(
                          'Gem Code :',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 22,
                            height: 2,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                ///gem code end
                ///gem name
                ///gem name
                Container(
                  padding: EdgeInsets.only(left: 20),
                  height: 60,
                  width: double.infinity,
                  color: Color(0xD1D3FCFF),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          'Gem Name :',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 22,
                            height: 2,
                          ),
                        ),
                      ),

                      ///place the gem name variable here
                      Expanded(
                        child: Text(
                          'Gem Name :',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 22,
                            height: 2,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                ///gem name end
                ///gem name end
                ///gem variety
                Container(
                  padding: EdgeInsets.only(left: 20),
                  height: 60,
                  width: double.infinity,
                  color: Color(0xD1D3FCFF),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          'Gem Variety :',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 22,
                            height: 2,
                          ),
                        ),
                      ),

                      ///place gem variety here
                      Expanded(
                        child: Text(
                          'Gem Variety :',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 22,
                            height: 2,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                ///gem variety end
                ///previous owner
                Container(
                  padding: EdgeInsets.only(left: 20),
                  height: 60,
                  width: double.infinity,
                  color: Color(0xDBD6EFFF),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          'Previous Owner :',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 22,
                            height: 2,
                          ),
                        ),
                      ),

                      ///previous owner here
                      Expanded(
                        child: Text(
                          'Previous Owner :',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 22,
                            height: 2,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                ///previous ownwer end
                ///gem holder
                Container(
                  padding: EdgeInsets.only(left: 20),
                  height: 60,
                  width: double.infinity,
                  color: Color(0xD1D3FCFF),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          'Gem Holder :',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 22,
                            height: 2,
                          ),
                        ),
                      ),

                      ///place the gem holder name here
                      Expanded(
                        child: Text(
                          'Gem Holder :',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 22,
                            height: 2,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                ///gem holder end
                ///purchased data
                Container(
                  padding: EdgeInsets.only(left: 20),
                  height: 60,
                  width: double.infinity,
                  color: Color(0xDBD6EFFF),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          'Purchase Date :',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 22,
                            height: 2,
                          ),
                        ),
                      ),

                      ///place the date here
                      Expanded(
                        child: Text(
                          'Purchase Date :',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 22,
                            height: 2,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                ///purchased date end

                Container(
                  height: 40,
                  width: double.infinity,
                  color: Color(0xFFACAFF2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        'Weights',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 22,
                          height: 2,
                        ),
                      ),
                    ],
                  ),
                ),

                ///rough
                Container(
                  padding: EdgeInsets.only(left: 20),
                  height: 60,
                  width: double.infinity,
                  color: Color(0xD1D3FCFF),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          'Rough :',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 22,
                            height: 2,
                          ),
                        ),
                      ),

                      ///place the variable here
                      Expanded(
                        child: Text(
                          'Rough :',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 22,
                            height: 2,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                ///rough end
                ///after perfrom
                Container(
                  padding: EdgeInsets.only(left: 20),
                  height: 60,
                  width: double.infinity,
                  color: Color(0xD1D3FCFF),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          'After perform :',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 22,
                            height: 2,
                          ),
                        ),
                      ),

                      ///place the variable here
                      Expanded(
                        child: Text(
                          'After Perform',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 22,
                            height: 2,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                ///after perfrom end
                ///after cut and ploush
                Container(
                  padding: EdgeInsets.only(left: 20),
                  height: 60,
                  width: double.infinity,
                  color: Color(0xD1D3FCFF),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          'After cut & polish',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 22,
                            height: 2,
                          ),
                        ),
                      ),

                      ///place the variable here
                      Expanded(
                        child: Text(
                          'after  :',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 22,
                            height: 2,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                ///after cut and polish
                Container(
                  height: 60,
                  width: double.infinity,
                  color: Color(0xFFACAFF2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        'Measurements After Cut & Polish',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 22,
                          height: 2,
                        ),
                      ),
                    ],
                  ),
                ),

                ///height and width
                Container(
                  height: 60,
                  width: double.infinity,
                  color: Color(0xDBD6EFFF),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          'Height :',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 22,
                            height: 2,
                          ),
                        ),
                      ),

                      ///height value
                      Expanded(
                        child: Text(
                          'Height :',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 22,
                            height: 2,
                          ),
                        ),
                      ),

                      ///width
                      Expanded(
                        child: Text(
                          'Height :',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 22,
                            height: 2,
                          ),
                        ),
                      ),

                      ///height value
                      Expanded(
                        child: Text(
                          'Height :',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 22,
                            height: 2,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                ///purchased price
                Container(
                  padding: EdgeInsets.only(left: 20),
                  height: 60,
                  width: double.infinity,
                  color: Color(0xD1D3FCFF),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          'Purchase Price: Rs',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 22,
                            height: 2,
                          ),
                        ),
                      ),

                      ///place the value
                      Expanded(
                        child: Text(
                          'value',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 22,
                            height: 2,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                ///purchased price end
                ///performing charges
                Container(
                  padding: EdgeInsets.only(left: 20),
                  height: 60,
                  width: double.infinity,
                  color: Color(0xD1D3FCFF),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          'Performing : Rs',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 22,
                            height: 2,
                          ),
                        ),
                      ),

                      ///place the value
                      Expanded(
                        child: Text(
                          'value',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 22,
                            height: 2,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                ///performing chrges end
                ///cutting charges
                Container(
                  padding: EdgeInsets.only(left: 20),
                  height: 60,
                  width: double.infinity,
                  color: Color(0xD1D3FCFF),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          'cutting : Rs',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 22,
                            height: 2,
                          ),
                        ),
                      ),

                      ///place the value
                      Expanded(
                        child: Text(
                          'value',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 22,
                            height: 2,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                ///cutting charges end
                ///total cost
                Container(
                  padding: EdgeInsets.only(left: 20),
                  height: 60,
                  width: double.infinity,
                  color: Color(0xD1D3FCFF),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          'Total: Rs',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 22,
                            height: 2,
                          ),
                        ),
                      ),

                      ///place the value
                      Expanded(
                        child: Text(
                          'value',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 22,
                            height: 2,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                ///total cost end
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF43468E),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 12.0),
                        textStyle:
                            TextStyle(fontSize: 20.0, color: Color(0xFF43468E)),
                      ),
                      child: Text('Back'),
                    ),
                    SizedBox(width: 8.0),
                    ElevatedButton(
                      onPressed: () {
                        /* Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AddGemPage()),
                        );*/
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF43468E),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 12.0),
                        textStyle:
                            TextStyle(fontSize: 20.0, color: Colors.white),
                      ),
                      child: Text('Delete'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
