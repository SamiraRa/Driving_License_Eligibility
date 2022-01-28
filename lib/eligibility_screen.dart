import 'package:driving_license/eligibility_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class EligibilityScreen extends StatelessWidget {
  
  final ageController = TextEditingController();

EligibilityScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider <EligibilityScreenProvider>(
      create: (context) => EligibilityScreenProvider(),
      child: Builder(builder: (context){
        return Scaffold(
      appBar: AppBar(title: const Text("Provider demo"),),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Form(
          child: Consumer<EligibilityScreenProvider>(
            builder: (context,provider,child){
              return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: provider.isEligibile? Colors.green : Colors.redAccent,
                  ),
                  height: 50,
                  width: 50,
                ),
          
                 const SizedBox(height: 16,),
          
                 TextFormField(
                   controller: ageController,
                   decoration: InputDecoration(hintText: "Give Your Age"),
                   keyboardType: TextInputType.number,
                 ),
          
                 const SizedBox(height: 16,),
          
                 Container(
                   width: double.infinity, //double.infinity,
                   // ignore: deprecated_member_use
                   child: FlatButton(
                     child:Text("Check"),
                     color: Colors.blue,
                     textColor: Colors.white,
                     onPressed: () {
                      int age = int.parse(ageController.text.trim());
                       provider.checkEligibility(age);
                     },
                     ),
                 ),
          
                 Text("you have not given any input"),
          
              ],
                  );
            },
          ),),
      ),
    );
      },)
    );
  }
}