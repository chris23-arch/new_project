import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final numbersProvider =
    StateNotifierProvider<NumberNotifier, List<String>>((ref) {
  return NumberNotifier();
});

class NumberNotifier extends StateNotifier<List<String>> {
  NumberNotifier() : super(['number 12', 'number30']);
// a message created which takes a number.
  void add(String number) {
    state = [
      ...state,
      number
    ]; // ...state gets all the lists then number adds a new one to list
  }

  void remove(String number) {
    state = [...state.where((element) => element != number)];
  }

  void update(String number, String updatedNumber) {
    final updatedList = <String>[];
    for (var i = 0; i < state.length; i++) {
      if (state[i] == number) {
        updatedList.add(updatedNumber);
      } else {
        updatedList.add(state[i]);
      }
    }
    state = updatedList;
  }
}

class Data extends ConsumerWidget {
  const Data({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final numbers = ref.watch(numbersProvider);
    return Scaffold(
        appBar: AppBar(
            title: Center(child: Text('Riverpod')),
            backgroundColor: Colors.blue),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            ref
                .read(numbersProvider.notifier)
                .add('number ${Random().nextInt(100)}');
          },
          child: const Icon(Icons.add),
        ), 
        body: Center(
          child: Column(
              children: numbers
                  .map((e) => GestureDetector(
                      onLongPress: () {
                        ref.read(numbersProvider.notifier).update(
                            e, '${e} ' + Random().nextInt(1000).toString());
                      },
                      onTap: () {
                        ref.read(numbersProvider.notifier).remove(e);
                      },
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(e),
                      )))
                  .toList()),
        ));
  }
}
