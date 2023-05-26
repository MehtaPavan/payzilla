import 'package:flutter/material.dart';
import 'package:payzilla/crypto.dart';
import 'package:payzilla/main.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
      body: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: [
          _buildHeader(screenHeight),
          _buildPreventionTips(screenHeight),
          // _buildYourOwnTest(screenHeight),
        ],
      ),
    );
  }
  SliverToBoxAdapter _buildHeader(double screenHeight) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.fromLTRB(18, 81, 15, 150),
        decoration: new BoxDecoration(
          image: new DecorationImage(
              image: new AssetImage("assets/images/home.png"),
              fit: BoxFit.fill,
              colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.9), BlendMode.modulate,)
          ),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30.0),
            bottomRight: Radius.circular(30.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Align(
            //   alignment:Alignment(0.0, -0.5),
            //   child: Text("widget"),
            // ),
            RichText(
              textAlign : TextAlign.start,
              text: TextSpan(text: "Welcome To, Payzilla",
                style: TextStyle(color: Colors.black, fontSize: 27,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            Stack(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenHeight * 0.02),
                Text('Money management made simple',
                  style: const TextStyle(color: Colors.black54,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildPreventionTips(double screenHeight) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Text(
            //   'Home',
            //   style: const TextStyle(
            //     fontSize: 25.0,
            //     fontWeight: FontWeight.w600,
            //   ),
            // ),

        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const expenseapp()));
              },
              child: Container(decoration: BoxDecoration(borderRadius:BorderRadius.circular(20),),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/pero.png',
                      width: 150,
                      height: 150,),
                    Text("Personal\nExpense",style: TextStyle(color: Colors.black,fontSize: 23,fontWeight:FontWeight.w500),)
                  ],),
              ),
            ),

            SizedBox(height: screenHeight * 0.0),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const Crypto()));
              },
              child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/bb.png',
                      width: 150,
                      height: 150,),
                    Text("Cryptocurrency",style: TextStyle(color: Colors.black,fontSize: 23,fontWeight:FontWeight.w500),)
                  ],),
              ),
            ),
          ],
        ),

            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: (){
                    // Navigator.push(context, MaterialPageRoute(builder: (context)=>personal()));
                  },
                  child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/stock.png',
                          width: 150,
                          height: 150,),
                        Text("Stock Market",style: TextStyle(color: Colors.black,fontSize: 23,fontWeight:FontWeight.w500),)
                      ],),
                  ),
                ),

                SizedBox(height: screenHeight * 0.0),
                InkWell(
                  onTap: (){
                    // Navigator.push(context, MaterialPageRoute(builder: (context)=>personal()));
                  },
                  child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/inc.png',
                          width: 150,
                          height: 150,),
                        Text("Income Tax",style: TextStyle(color: Colors.black,fontSize: 23,fontWeight:FontWeight.w500),)
                      ],),
                  ),
                ),
              ],
            ),

          ]
      ),
    ));
  }
}
