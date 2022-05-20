import 'package:exapme_statemanagment_provider/CounterState.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class PageProvider extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    CounterState counterState = Provider.of<CounterState>(context,listen: false);
    return Scaffold(
      appBar: AppBar(title: Text('Counter Provider')),
      body:Center(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Consumer(builder: (context,CounterState counter_state, child){
                print('consumer...');
                return Text('counter => ${counter_state.getState()}',style: Theme.of(context).textTheme.headline4,);
              })
            ],
          )
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(onPressed: (){
            counterState.decrement();
          }, child: Icon(Icons.remove),),
          SizedBox(width: 10,),
          FloatingActionButton(onPressed: (){
            counterState.increment();
          }, child: Icon(Icons.add),),
        ],
      ),
    );
  }
}

