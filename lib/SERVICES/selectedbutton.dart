import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectedButton extends ConsumerWidget {
  SelectedButton({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final isRed = ref.watch(isRedProvider);


    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("RiverPod")),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () =>
                  ref.read(selectedButtonProvider.notifier).state = 'red',
              child: Text('Red'),
            ),
            ElevatedButton(
              onPressed: () =>
                  ref.read(selectedButtonProvider.notifier).state = 'blue',
              child: Text('Blue'),
            ),
            isRed ? Text('Color is red') : Text('Color is blue')
          ],
        ),
      ),
    );
  }
}
 
final isRedProvider = Provider<bool>((ref) {
  final color = ref.watch(selectedButtonProvider);
  return color == 'red'; // true if red
});
final selectedButtonProvider = StateProvider<String>((ref) => '');
