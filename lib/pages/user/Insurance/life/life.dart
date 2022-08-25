import 'package:firebasetut/pages/user/Insurance/brochure.dart';
import 'package:flutter/material.dart';

class Lifeinsurance extends StatefulWidget {
  const Lifeinsurance({Key? key}) : super(key: key);

  @override
  State<Lifeinsurance> createState() => _LifeinsuranceState();
}

class _LifeinsuranceState extends State<Lifeinsurance> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Brochures", style: TextStyle(color: Colors.white)),
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, 'insurance');
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
          child: SingleChildScrollView(
        child: Column(children: [
          Brochure(
            image: "assets/images/insurance/bg/companies/life.png",
            title: "Care with Super NCB",
            copay: "You pay 20% of claim",
            covid: "Yes",
            maternity: "Not Covered",
            hospitalroom: "Twin Sharing",
            bonus: "Not Available",
            restoration: "Upto Rs 5L",
            price: "6548",
          ),
          Brochure(
            image: "assets/images/insurance/bg/companies/bluestar.png",
            title: "Women Care",
            copay: "You pay 0% of claim",
            covid: "Yes",
            maternity: "Rs 25000/-",
            hospitalroom: "Rs 5000/-per day",
            bonus: "Rs 1L to Rs 5L",
            restoration: "100%",
            price: "9399",
          ),
          Brochure(
            image: "assets/images/insurance/bg/companies/Nivia.png",
            title: "Health Companion",
            copay: "No copay",
            covid: "Yes",
            maternity: "Not Covered",
            hospitalroom: "No capping on room rent",
            bonus: "20% to 100%",
            restoration: "Upto Rs 5L",
            price: "6797",
          ),
          Brochure(
            image: "assets/images/insurance/bg/companies/adityabirla.png",
            title: "Activ Health - Platinum Enhance",
            copay: "You pay 10% of claim",
            covid: "Yes",
            maternity: "Not Covered",
            hospitalroom: "Twin Sharing",
            bonus: "Rs 0.25L per year upto Rs 2.5L",
            restoration: "Not Applicable",
            price: "7865",
          ),
          Brochure(
            image: "assets/images/insurance/bg/companies/sbi.png",
            title: "Care with Super NCB",
            copay: "You pay 0% of claim",
            covid: "Yes",
            maternity: "Not Covered",
            hospitalroom: "Single Private Ac Room",
            bonus: "Rs 2.5L per year upto Rs 5L",
            restoration: "Upto Rs 5L",
            price: "3397",
          ),
        ]),
      )),
    ));
  }
}
