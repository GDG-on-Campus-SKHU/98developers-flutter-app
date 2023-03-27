import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zikiza/models/post_enroll.dart';
import 'package:zikiza/screens/home.dart';
import 'package:zikiza/screens/pay.dart';

import '../cubits/challenge_enroll_cubit.dart';

class EnrollScreen extends StatelessWidget {
  const EnrollScreen({super.key, required this.id});
  final id;
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    final dynamicColor = Theme.of(context).colorScheme;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: dynamicColor.surfaceVariant,
        ),
        body: BlocBuilder<ChallengeEnrollCubit, ChallengeEnrollState>(
          builder: (_, state) {
            if (state is ChallengeEnrollInitial) {
              return FutureBuilder(
                future: _.read<ChallengeEnrollCubit>().getEnroll(id),
                builder: (BuildContext context, snapshot) {
                  if (snapshot.hasData) {
                    var title = snapshot.data!.topic;
                    var proof = snapshot.data!.howProof;
                    var expResult = snapshot.data!.expectedResults;
                    var notice = snapshot.data!.pleaseNote;
                    return Container(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                              width: _width,
                              padding: EdgeInsets.all(10),
                              child: Text('${title}')),
                          Container(
                              width: _width,
                              padding: EdgeInsets.all(10),
                              child: Text('${proof}')),
                          Container(
                              width: _width,
                              padding: EdgeInsets.all(10),
                              child: Text('${expResult}')),
                          Container(
                              width: _width,
                              padding: EdgeInsets.all(10),
                              child: Text('${notice}')),
                        ],
                      ),
                    );
                  } else {
                    return Container();
                  }
                },
              );
            } else {
              return Container();
            }
          },
        ),
        bottomSheet: Container(
            height: 100,
            alignment: Alignment.center,
            color: dynamicColor.secondaryContainer,
            child: GestureDetector(
              child: Container(
                width: _width * 0.5,
                height: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: dynamicColor.surface),
              ),
              onTap: () {
                _showEnrolldialog(context, id);
                // Navigator.push(context,
                //     MaterialPageRoute(builder: ((context) => PayScreen())));
                // PayScreen().bootpayTest(context, id);
              },
            )));
  }
}

Future _showEnrolldialog(context, id) {
  // final dynamicColor = Theme.of(context).colorScheme;

  return showDialog(
      context: context,
      builder: ((context) {
        return AlertDialog(
          title: Text('신청창'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('뒤로가기')),
            TextButton(
                onPressed: () {
                  postEnroll(id);
                  Navigator.pop(context);
                },
                child: Text('신청하기')),
          ],
        );
      }));
}
