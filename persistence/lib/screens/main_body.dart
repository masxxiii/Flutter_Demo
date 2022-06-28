import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:states/screens/cubit/main_screen_cubit.dart';

class MainBody extends StatefulWidget {
  const MainBody({Key? key}) : super(key: key);

  @override
  State<MainBody> createState() => MainBodyState();
}

class MainBodyState extends State<MainBody> {
  final _formKey = GlobalKey<FormState>();
  final _fieldA = TextEditingController();
  final _fieldB = TextEditingController();

  bool _agreement = false;

  late double a;
  late double b;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            const Padding(padding: EdgeInsets.only(top: 10)),
            TextFormField(
              decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'Enter a value for a',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(
                      color: Colors.deepPurple,
                      width: 1.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(
                          color: Colors.deepPurple,
                          width: 1.0
                      )
                  )
              ),
              keyboardType: TextInputType.number,
              controller: _fieldA,
              validator: (value) {
                if((value!.isEmpty) || (double.tryParse(value) == null)) {
                  return 'Please enter a numeric value';
                } else {
                  a = double.parse(value);
                }
                return null;
              },
            ),
            const Padding(padding: EdgeInsets.only(top: 10)),
            TextFormField(
              decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'Enter a value for b',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(
                      color: Colors.deepPurple,
                      width: 1.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(
                          color: Colors.deepPurple,
                          width: 1.0
                      )
                  )
              ),
              keyboardType: TextInputType.number,
              controller: _fieldB,
              validator: (value) {
                if((value!.isEmpty) || (double.tryParse(value) == null)) {
                  return 'Please enter a numeric value';
                } else {
                  b = double.parse(value);
                }
                return null;
              },
            ),
            const Padding(padding: EdgeInsets.only(top: 10)),
            CheckboxListTile(
              value: _agreement,
              title: const Text('I confirm that I am familiar with the provisions of the Federal Law of July 27, 2006 No. 152-FZ "On Personal Data" and I agree to the processing of my personal data'
              ),
              onChanged: (bool? value) => setState(() => _agreement = value!),
            ),

            const SizedBox(height: 20),
            ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.deepPurple.shade200),
                onPressed: _agreement ? () {
                  if (_formKey.currentState!.validate()) {
                    BlocProvider.of<MainScreenCubit>(context).squareCalculation(a, b);
                  }
                }: null,
                child: const Text('Calculate')
            ),
          ],
        ),
      ),
    );
  }
}
