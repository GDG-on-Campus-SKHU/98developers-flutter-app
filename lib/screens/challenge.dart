import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zikiza/cubits/challenge_list_cubit.dart';
import 'package:zikiza/screens/enroll.dart';
import 'package:zikiza/utilities/typografie.dart';
import 'package:zikiza/widgets/light_appbar.dart';

class ChallengeScreen extends StatefulWidget {
  const ChallengeScreen({super.key});

  @override
  State<ChallengeScreen> createState() => _ChallengeScreenState();
}

class _ChallengeScreenState extends State<ChallengeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext _) {
    final _width = MediaQuery.of(_).size.width;
    final _height = MediaQuery.of(_).size.height;
    final dynamicColor = Theme.of(_).colorScheme;

    return Scaffold(
      body: BlocBuilder<ChallengeListCubit, ChallengeListState>(
        builder: (_, state) {
          return FutureBuilder(
            future: _.read<ChallengeListCubit>().getChalllengeList(),
            builder: (_, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    SizedBox(height: 20),
                    Container(
                      width: _width,
                      height: 60.0,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Typografie()
                            .TitleLarge('Available', dynamicColor.primary),
                      ),
                    ),
                    Container(
                      width: _width,
                      height: _height * 0.6,
                      alignment: Alignment.center,
                      child: ListView.builder(
                        itemCount: snapshot.data!.listData.length,
                        itemBuilder: (BuildContext context, int index) {
                          var challengeId = snapshot.data!.listData[index].id;
                          var title = snapshot.data!.listData[index].topic;
                          var headCount =
                              snapshot.data!.listData[index].headCount;
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
                              height: 130.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25.0),
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
                                          child: Typografie().LabelMedium(
                                            "${title}",
                                            dynamicColor.onPrimaryContainer,
                                          ),
                                        ),
                                        Container(
                                          width: _width * 0.7,
                                          child: Row(
                                            children: [
                                              BadgeWidget(
                                                padding: const EdgeInsets.only(
                                                    right: 10.0),
                                                color: dynamicColor
                                                    .onPrimaryContainer,
                                                children: [
                                                  Icon(
                                                    Icons.person_rounded,
                                                    size: 15.0,
                                                    color:
                                                        dynamicColor.onPrimary,
                                                  ),
                                                  Typografie().BodyMedium(
                                                    "${headCount}",
                                                    dynamicColor.onPrimary,
                                                  ),
                                                ],
                                              ),
                                              SizedBox(width: 10.0),
                                              BadgeWidget(
                                                padding: const EdgeInsets.only(
                                                    left: 10.0, right: 10.0),
                                                color: dynamicColor
                                                    .onPrimaryContainer,
                                                children: [
                                                  Typografie().BodyMedium(
                                                    "${startDate} ~ ${endDate}",
                                                    dynamicColor.onPrimary,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      height: 100,
                                      child: IconButton(
                                        icon: Icon(
                                          Icons.arrow_forward,
                                          color:
                                              dynamicColor.onPrimaryContainer,
                                          size: 25,
                                        ),
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (_) => enrollScreen(
                                                id: challengeId,
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              } else {
                return Container();
              }
            },
          );
        },
      ),
      appBar: LightAppBar(
        backgroundColor: dynamicColor.background,
        title: Typografie()
            .HeadlineMedium("Challenges", dynamicColor.onBackground),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

/**
 - 챌린지 스크린의 리스트 빌더로 생성되는 챌린지 항목에 포함되는 위젯입니다.
 - 참가자 수, 챌린지 기간 등 특정 값에 표시하기 위한 위젯입니다.
 */
class BadgeWidget extends StatelessWidget {
  final EdgeInsetsGeometry padding;
  final List<Widget> children;
  final Color? color;
  final double? height;
  final double? width;

  BadgeWidget({
    required this.padding,
    required this.children,
    this.color,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: this.padding,
        child: Row(
          children: children,
        ),
      ),
      width: this.width,
      height: 28.0,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: this.color,
      ),
    );
  }
}
