import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zikiza/models/post_enroll.dart';
import 'package:zikiza/cubits/challenge_enroll_cubit.dart';
import 'package:zikiza/screens/pay.dart';

import '../cubits/challenge_enroll_cubit.dart';
import '../utilities/typografie.dart';

class EnrollScreen extends StatelessWidget {
  const EnrollScreen({super.key, required this.id});

  final id;
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
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
                            child: Typografie().HeadlineMedium(
                                '$title', dynamicColor.onPrimaryContainer)),
                        Container(
                            width: _width,
                            padding: EdgeInsets.only(left: 10, top: 10),
                            child: Typografie().LabelLarge('About proper proof',
                                dynamicColor.onPrimaryContainer)),
                        Container(
                            width: _width,
                            padding: EdgeInsets.all(10),
                            child: Typografie().BodyMedium(
                                '${proof}', dynamicColor.onPrimaryContainer)),
                        Container(
                            width: _width,
                            padding: EdgeInsets.only(left: 10, top: 10),
                            child: Typografie().LabelLarge(
                                'Benefit', dynamicColor.onPrimaryContainer)),
                        Container(
                            width: _width,
                            padding: EdgeInsets.all(10),
                            child: Typografie().BodyMedium('${expResult}',
                                dynamicColor.onPrimaryContainer)),
                        Container(
                            width: _width,
                            padding: EdgeInsets.only(left: 10, top: 10),
                            child: Typografie().LabelLarge('Please note',
                                dynamicColor.onPrimaryContainer)),
                        Container(
                            width: _width,
                            padding: EdgeInsets.all(10),
                            child: Typografie().BodyMedium(
                                '${notice}', dynamicColor.onPrimaryContainer)),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          PayScreen().bootpayTest(context, id);
        },
        tooltip: 'enroll',
        backgroundColor: dynamicColor.primaryContainer,
        child: Icon(
          Icons.back_hand,
          color: dynamicColor.onPrimaryContainer,
        ),
      ),
    );
  }
}
