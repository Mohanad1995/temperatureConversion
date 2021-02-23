import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double fahTemp =0.0;
  double celTemp =0.0;
  bool isFar=true;
  TextEditingController farController=TextEditingController();
  TextEditingController CelController=TextEditingController();
  var temperatures=['Celsius','Farhrenhite','Kalvin'];
  var selectedTem1 = 'Celsius';
  var selectedTem2 = 'Farhrenhite';

  @override
  void initState() {
    farController.addListener(farListener);
    CelController.addListener(celcListener);

    // TODO: implement initState
    super.initState();
  }
  farListener(){
  fahTemp = double.parse(farController.text);
  celTemp = Convert(fahTemp,true);
  if(isFar) CelController.text=celTemp.toString();
  isFar = true;
  }
  celcListener(){
    setState(() {
      celTemp = double.parse(CelController.text);
      fahTemp = Convert(celTemp,false);
      if(!isFar)  farController.text=fahTemp.toString();
        isFar = false;
    });
  }
  double Convert(double temb , bool isFar){
    return isFar ? (temb -32)*(5/9):(temb* 9/5)+32;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Temperature Conversion')),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18,horizontal: 16),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('This is a temperature conversion app where you can convert temperature with ease',style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.pink
            ),),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      DropdownButton(
                          items: temperatures.map((item) {
                            return DropdownMenuItem(
                              child: Text(item),
                              value:item,
                            );
                          } ).toList(),
                          value: selectedTem1,
                          onChanged: (newvalue){
                            setState(() {
                              selectedTem1=newvalue;
                            });
                          }
                      ),
                      TextField(
                        controller: farController,
                        decoration: InputDecoration(
                          suffixText: 'F',
                        ),
                        keyboardType: TextInputType.number,
                      )
                    ],
                  ),
                ),
                SizedBox(width: 40,),
                Expanded(
                  child: Column(
                    children: [
                      DropdownButton(
                          items: temperatures.map((item) {
                            return DropdownMenuItem(
                              child: Text(item),
                              value:item,
                            );
                          } ).toList(),
                          value: selectedTem2,
                          onChanged: (newvalue){
                            setState(() {
                              selectedTem2=newvalue;
                            });
                          }
                      ),
                      TextField(
                        controller: CelController,
                        decoration: InputDecoration(
                          suffixText: 'C',
                        ),
                        keyboardType: TextInputType.number,
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        )
      ),

    );
  }
}
