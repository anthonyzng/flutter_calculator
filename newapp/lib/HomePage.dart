import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; //for input number only


class HomePage extends StatefulWidget{
  //var
  String title = "Calculator";
  HomePage({Key key}):super(key: key);
  
  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {
    final txtCont = TextEditingController();
    String showTxt ="" ;
    double total = 0;

    @override
    Widget build(BuildContext context) {
     //showTxt = total.toString();
      return Scaffold(
          appBar: createAppBar(),
          body: calculator(),
        );
    }

    void add(){
      setState(() {
          this.showTxt = this.total.toString()+" + " + this.txtCont.text;
          this.total = this.total + double.parse(this.txtCont.text);
          this.showTxt = this.showTxt + " = " + this.total.toString();
      });
    }

    
    void sub(){
      setState(() {
          this.showTxt = this.total.toString()+" - " + this.txtCont.text;
          this.total = this.total - double.parse(this.txtCont.text);
          this.showTxt = this.showTxt + " = " + this.total.toString();
      });
    }

    
    void div(){
      setState(() {
          this.showTxt = this.total.toString()+" / " + this.txtCont.text;
          this.total = this.total / double.parse(this.txtCont.text);
          this.showTxt = this.showTxt + " = " + this.total.toStringAsFixed(5);
      });
    }

    void mut(){
      setState(() {
          this.showTxt = this.total.toString()+" * " + this.txtCont.text;
          this.total = this.total * double.parse(this.txtCont.text);
          this.showTxt = this.showTxt + " = " + this.total.toString();
      });
    }

    void clear(){
      setState(() {
          this.showTxt = "0";
          this.total = 0;
      });
    }

    Widget calculator(){
        return  
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
              children: [
                Text(this.showTxt,style:TextStyle(fontSize: 50),),
                TextFormField(controller: txtCont,decoration: InputDecoration(labelText: "Enter a Number:"),keyboardType: TextInputType.numberWithOptions(decimal:true),
                  inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))]
                ),
                Row(
                       mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(child: IconButton(icon: Icon(Icons.add,size: 40,color: Colors.black), onPressed:(){add();},),flex: 1,),
                        Expanded(child: IconButton(icon: Icon(Icons.remove,size: 40,color: Colors.black), onPressed:(){sub();}),flex: 1,),
                        Expanded(child: IconButton(icon: Icon(Icons.close,size: 40,color: Colors.black), onPressed: (){mut();}),flex: 1,),
                        Expanded(child: IconButton(icon: Image.asset("../assets/icon/division.png"), onPressed: (){div();}),flex: 1,),]
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children:[
                     Expanded(child: IconButton(icon:Icon(Icons.clear_all,size:40,color: Colors.black,), onPressed: (){clear();},),flex: 1,),
                  ]
                )
              ]
            ),
          );
    }

    AppBar createAppBar(){
    return AppBar(
      leading: IconButton(icon: Icon(Icons.account_balance_rounded,color: Colors.red),onPressed: null,),
      centerTitle: true,
      title: Image.asset("../assets/images/samsung.png"),
      actions: <Widget>[IconButton(icon: Image.asset("../assets/images/apple.png"), onPressed: null),
      ],
    );
}
    
}