import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter_app/bloc/counter_bloc.dart';
import 'package:flutter_counter_app/bloc/counter_event.dart';
import 'package:flutter_counter_app/bloc/counter_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: SizedBox(
        // padding: EdgeInsets.symmetric(vertical: 80),
        width: double.infinity,
        // color: Colors.blue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                return Text(
                 state.counter.toString(),
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
                );
              },
            ),
            OverflowBar(
              spacing: 50,
              children: [
                ElevatedButton(
                  onPressed: () {
                    print("plus");
                    context.read<CounterBloc>().add(IncrementCounter());

                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "+",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      print("minus");
                        context.read<CounterBloc>().add(DecrementCounter());
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "-",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w700),
                      ),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
