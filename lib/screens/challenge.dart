import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zikiza/cubits/challenge_list_cubit.dart';
import 'package:zikiza/screens/enroll.dart';

import '../models/challng_model.dart';

class ChallengeScreen extends StatefulWidget {
  const ChallengeScreen({super.key});

  @override
  State<ChallengeScreen> createState() => _ChallengeScreenState();
}

class _ChallengeScreenState extends State<ChallengeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    final dynamicColor = Theme.of(context).colorScheme;

    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          backgroundColor: dynamicColor.surfaceVariant,
          title: Container(
            width: _width,
            child: Text(
              'Challenge',
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w400,
                  color: dynamicColor.onPrimaryContainer),
            ),
          ),
        ),
        backgroundColor: dynamicColor.background,
        body: BlocBuilder<ChallengeListCubit, ChallengeListState>(
          builder: (_, state) {
            return FutureBuilder(
                future: _.read<ChallengeListCubit>().getChalllengeList(),
                builder: (BuildContext context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: _width,
                          height: 60,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              'Available',
                              style: TextStyle(
                                  fontSize: 23,
                                  color: dynamicColor.primary,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                        Container(
                          width: _width,
                          height: _height * 0.6,
                          alignment: Alignment.center,
                          child: ListView.builder(
                            itemCount: snapshot.data!.listData.length,
                            itemBuilder: (BuildContext context, int index) {
                              var title = snapshot.data!.listData[index].topic;
                              var startDate = snapshot
                                  .data!.listData[index].periodStartDate!
                                  .substring(5, 10);
                              var endDate = snapshot
                                  .data!.listData[index].periodEndDate!
                                  .substring(5, 10);

                              return Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 10.0, left: 10, right: 10),
                                child: Container(
                                    width: _width * 0.9,
                                    height: 130,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        color: dynamicColor.primaryContainer),
                                    child: Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                width: _width * 0.7,
                                                child: Text(
                                                  '${title}',
                                                  style: TextStyle(
                                                      fontSize: 19,
                                                      color: dynamicColor
                                                          .onPrimaryContainer,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ),
                                              Container(
                                                  width: _width * 0.7,
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        alignment:
                                                            Alignment.center,
                                                        height: 28,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        25),
                                                            color: dynamicColor
                                                                .onPrimaryContainer),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 10.0,
                                                                  right: 10),
                                                          child: Row(
                                                            children: [
                                                              Icon(
                                                                Icons.person,
                                                                size: 16,
                                                                color: dynamicColor
                                                                    .onTertiary,
                                                              ),
                                                              Text(
                                                                ' 379',
                                                                style: TextStyle(
                                                                    color: dynamicColor
                                                                        .onTertiary,
                                                                    fontSize:
                                                                        13,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Container(
                                                        alignment:
                                                            Alignment.center,
                                                        height: 28,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        25),
                                                            color: dynamicColor
                                                                .onPrimaryContainer),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 10.0,
                                                                  right: 10),
                                                          child: Text(
                                                              '$startDate ~ $endDate',
                                                              style: TextStyle(
                                                                  color: dynamicColor
                                                                      .onTertiary,
                                                                  fontSize: 13,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500)),
                                                        ),
                                                      )
                                                    ],
                                                  )),
                                            ],
                                          ),
                                          Container(
                                            height: 100,
                                            child: IconButton(
                                              icon: Icon(
                                                Icons.arrow_forward,
                                                color: dynamicColor
                                                    .onPrimaryContainer,
                                                size: 25,
                                              ),
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (_) =>
                                                            enrollScreen()));
                                              },
                                            ),
                                          )
                                        ],
                                      ),
                                    )),
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  } else {
                    return Container();
                  }
                });
          },
        ));
  }
}
