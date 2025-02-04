import 'package:droute_frontend/styles/color/app_color.dart';
import 'package:droute_frontend/screens/user/pay_now.dart';
import 'package:flutter/material.dart';

class AddAddressScreenReceiver extends StatefulWidget {
  const AddAddressScreenReceiver({super.key});

  @override
  State<AddAddressScreenReceiver> createState() => _AddAddressScreenReceiverState();
}

class _AddAddressScreenReceiverState extends State<AddAddressScreenReceiver> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Address",style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Enter Receiver Address:",style: TextStyle(fontWeight: FontWeight.bold),),


            CustomTitleTextField(title: "Name:",hintText: "Enter Name Here"),
            SizedBox(height: 5,),
            CustomTitleTextField(title: "Contact No:",hintText: "Enter Contact No."),
            SizedBox(height: 5,),
            CustomTitleTextField(title: "House no. /Apartment /Street :",hintText: "Enter House no. /Apartment /Street "),
            SizedBox(height: 5,),
            CustomTitleTextField(title: "LandMark(optional):",hintText: "Enter Landmark here"),
            SizedBox(height: 5,),
            Row(
              children: [
                Expanded( // Makes the first text field take up available space
                  child: CustomTitleTextField(
                    title: "Pin Code :",
                    hintText: "Enter Pin Code",
                  ),
                ),
                SizedBox(width: 5), // Adds spacing between the fields
                Expanded( // Makes the second text field take up available space
                  child: CustomTitleTextField(
                    title: "City :",
                    hintText: "Enter City",
                  ),
                ),
              ],
            ),
            CustomTitleTextField(
              title: "State :",
              hintText: "Enter Your State",
            ),
            SizedBox(height: 30,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>CheckOutPayNow()));
                }, child: Text("Next")),
              ],
            )
          ],
        ),
      ),
    );
  }
}

Widget CustomTitleTextField({
  required String title,
  required String hintText,
}){
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(title,style: TextStyle(fontWeight: FontWeight.bold),),
      SizedBox(height: 3,),
      TextField(
        decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.grey
                )
            )
        ),
      ),
    ],
  );
}