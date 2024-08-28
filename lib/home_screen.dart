

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final TextEditingController _firstnumTEController=TextEditingController();
  final TextEditingController _secondTEController=TextEditingController();

  double _result=0;
 final GlobalKey<FormState> _formKey=GlobalKey<FormState>();
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:const Text('Calculate'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding:const EdgeInsets.all(16),
        child: Form(
          key:_formKey ,
          child: Column(
            children: [
              TextFormField(
                 validator:(String?value){
                   if(value==null ||value.isEmpty){
                     return 'Enter a value';
                   }
                   return null;
                 },
                keyboardType: TextInputType.number,
                controller:_firstnumTEController ,
                decoration:const InputDecoration(
                labelText:'firstnunber',

              ),),
             const SizedBox(height: 16,),
              TextFormField(
                validator:(String?value){
                  if(value==null ||value.isEmpty){
                    return 'Enter a value';
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
                controller: _secondTEController,
                decoration:const InputDecoration(
                labelText:'secondnunber',
              ),),
           const   SizedBox(height: 16,),
             _buildButtonBar(),
             const SizedBox(height: 25,),
              Text('Result:${_result.toStringAsFixed(2)}',style:const TextStyle(
                fontSize: 18,
              ),)
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildButtonBar(){
    return  ButtonBar(
      alignment: MainAxisAlignment.center,
      children: [
        TextButton(onPressed: _onTapAdd, child:const Text('+')),
        TextButton(onPressed: _onTapMainus, child:const Text('-')),
        TextButton(onPressed: _onTapMultiply, child:const Text('*')),
        TextButton(onPressed: _onTapdevided, child:const Text('/')),
      ],
    );
  }

  void _onTapAdd(){
    if(_formKey.currentState!.validate()==false){
      return;
    }
    double firstnum=double.tryParse(_firstnumTEController.text)??0;
    double secondnum=double.tryParse(_secondTEController.text)??0;
    _result= firstnum+secondnum;
    setState(() {

    });
  }

  void _onTapMainus(){
    if(_formKey.currentState!.validate()==false){
      return;
    }
    double firstnum=double.tryParse(_firstnumTEController.text)??0;
    double secondnum=double.tryParse(_secondTEController.text)??0;
    _result= firstnum-secondnum;
    setState(() {

    });
  }

  void _onTapMultiply(){
    if(_formKey.currentState!.validate()==false){
      return;
    }
    double firstnum=double.tryParse(_firstnumTEController.text)??0;
    double secondnum=double.tryParse(_secondTEController.text)??0;
    _result= firstnum*secondnum;
    setState(() {

    });
  }

  void _onTapdevided(){
    if(_formKey.currentState!.validate()==false){
      return;
    }
    double firstnum=double.tryParse(_firstnumTEController.text)??0;
    double secondnum=double.tryParse(_secondTEController.text)??0;
    _result= firstnum/secondnum;
    setState(() {

    });
  }

void dispse(){
    _firstnumTEController.dispose();
    _secondTEController.dispose();
    super.dispose();
}
}

