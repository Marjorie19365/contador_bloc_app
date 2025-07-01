import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/counter_bloc.dart';
import 'bloc/counter_event.dart';
import 'bloc/counter_state.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterBloc(),
      child: MaterialApp(title: 'Contador con Bloc', home: CounterPage()),
    );
  }
}

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<CounterBloc>();

    return Scaffold(
      appBar: AppBar(title: Text('Contador con Bloc')),
      body: Center(
        child: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            return Text(
              'Contador: ${state.count}',
              style: TextStyle(fontSize: 30),
            );
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'increment',
            onPressed: () => bloc.add(Increment()),
            child: Icon(Icons.add),
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            heroTag: 'decrement',
            onPressed: () => bloc.add(Decrement()),
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
