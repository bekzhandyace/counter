import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Complex {
  var valueOne = 0;
  var valueTwo = 0;
}

class Model extends ChangeNotifier {
  var one = 0;
  var two = 0;
  final complex = Complex();

  void inc1() {
    one += 1;
    notifyListeners();
  }

  void inc2() {
    two += 2;
    notifyListeners();
  }

  // void incComplex1 {
  //  complex.valueOne += 1;
  //  notifyListeners();
  // }

  // void incComplex2 {
  //  complex.valueOne += 1;
  //  notifyListeners();
  // }
}

class ForExample extends ChangeNotifier {
  var one = 0;
  void inc1() {
    one += 1;
    notifyListeners();
  }
}

class Wrapper {
  final Model model;
  final ForExample forExample;

  Wrapper(this.model, this.forExample);
}

class ExampleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => Model(),
          ),
          ChangeNotifierProvider(
            create: (_) => ForExample(),
          ),
          ProxyProvider2(update: (context, model, forExample, prev) {
            return ForExample();
          })
        ],
        child: const _View(),
      );
}

class _View extends StatelessWidget {
  const _View({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.read<Model>();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ElevatedButton(
              child: const Text('one'),
              onPressed: state.inc1,
            ),
            ElevatedButton(
              child: const Text('two'),
              onPressed: state.inc2,
            ),
            ElevatedButton(
              child: const Text('complex1'),
              onPressed: () {},
            ),
            ElevatedButton(
              child: const Text('complex1'),
              onPressed: () {},
            ),
            _OneWidget(),
            _TwoWidget(),
            _ThreeWidget(),
            _FourWidget(),
          ],
        ),
      ),
    );
  }
}

class _OneWidget extends StatelessWidget {
  const _OneWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final value = context.select((Model value) => value.one);
    return Text("$value");
  }
}

class _TwoWidget extends StatelessWidget {
  const _TwoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final value = context.select((Model value) => value.two);
    return Text("$value");
  }
}

class _ThreeWidget extends StatelessWidget {
  const _ThreeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final value = context.select((Model value) => value.complex.valueOne);
    return Text("$value");
  }
}

class _FourWidget extends StatelessWidget {
  const _FourWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final value = context.select((Model value) => value.complex.valueTwo);
    return Text("$value");
  }
}
