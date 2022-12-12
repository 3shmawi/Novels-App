import 'package:flutter/material.dart';

class DefaultNovelText extends StatelessWidget {
  const DefaultNovelText({
    required this.text,
    required this.fontSize,
    Key? key,
  }) : super(key: key);

  final String text;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.caption!.copyWith(
            fontWeight: FontWeight.bold,
            height: 1.3,
            fontSize: fontSize,
          ),
    );
  }
}

class DefaultFontSizeSlider extends StatelessWidget {
  const DefaultFontSizeSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      color: Colors.grey[200],
      elevation: 50,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 15.0, top: 8),
            child: DefaultNovelText(
              text: 'Font Size',
              fontSize: 12,
            ),
          ),
          Slider(
            value: 12,
            max: 50,
            min: 12,
            onChanged: (v) {},
          ),
        ],
      ),
    );
  }
}


class DefaultNovelContent extends StatelessWidget {
  const DefaultNovelContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: const [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: DefaultNovelText(
                  text: 'J.D. Salinger',
                  fontSize: 20,
                ),
              ),
              DefaultNovelText(
                text:
                'Pencey  is   Holden’s  fourth  school; he has already failed out of three others.At  Pencey, he has  failed four  out  of  five of  his classes and  has  received notice   that   he is   being expelled,  but  he  is  not scheduled  to return home  to  Manhattan  until  Wedne-sday. He visits his  elderly history teacher, Spencer, to say   goodbye,  but    when  Spencer  tries  to reprimand him  for his poor  academic perfo rm ance, Holden becomes annoyed. Back in the dorm itory,  Holden is further  irritated by his unhygienic neighbor, Ackley, and by his own  roommate,  Strad later.Stradlater  spends   the  evening   on a  date with   Jane  Gallagher, a   girl  whom  Holden used  to  date  and  whom  he   still  admires. During  the   course  of  the   evening, Holden grows increasingly nervous about Stradlater’s   taking   Jane   out,   and   when Stradlater returns,  Holden   questions   him  insist ently about whether he tried to  have sex with her. Stradlater   teases  Holden,  who  flies  into  a rage and attacks  Stradlater. Stradlater pins Holden down and  bloodies his nose. Holden decides   that  he’s  enough  of  Pencey  and  will goand bloodies his nose.Holden decides that  he’s  enough  of  Pencey  and  will go and  bloodies his nose. Holden decides  that  he’s  enough  of  Pencey  and  will go\n',
                fontSize: 18,
              )
            ],
          ),
        ),
      ),
    );
  }
}
