import 'package:flutter/material.dart';
import 'package:pokedex/utils/responsive/responsive.dart';
import 'package:skeletons/skeletons.dart';

class PokemonItemSkeleton extends StatelessWidget {
  const PokemonItemSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 20.w(context),
        height: 20.w(context),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                  color: Color.fromARGB(255, 210, 210, 210),
                  spreadRadius: 1,
                  blurRadius: 5)
            ]),
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Container(
              height: 12.w(context),
              decoration: BoxDecoration(
                  color: const Color(0xffEFEFEF),
                  borderRadius: BorderRadius.circular(15)),
            ),
            Positioned(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SkeletonAvatar(
                    style: SkeletonAvatarStyle(
                      width: 20.w(context),
                      height: 20.w(context),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(bottom: 0.4.h(context)),
                      child: SkeletonParagraph(
                        style: const SkeletonParagraphStyle(lines: 1),
                      )),
                ],
              ),
            ),
          ],
        ));
  }
}
