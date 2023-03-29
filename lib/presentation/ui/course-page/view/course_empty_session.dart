import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unimastery_mobile/presentation/components/label/label.dart';
import 'package:unimastery_mobile/presentation/components/other/space.dart';
import 'package:unimastery_mobile/presentation/shared/ui_color.dart';
import 'package:unimastery_mobile/presentation/util/services/share_service.dart';

class EmptySession extends StatelessWidget {
  const EmptySession({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26.0),
      child: Column(
        children: [
          const SizedBox(height: 36),
          const Label(
            text: "Congrats for your\nnew workshop",
            color: UIColor.jeansBlue,
            size: 22,
            align: TextAlign.center,
          ),
          const Space(height: 36),
          Label(
            text: "We will review it in the next few hours in the meanwhile you can start and upload your sessions",
            size: 16,
            align: TextAlign.center,
            color: UIColor.black.withOpacity(0.5),
          ),
          const Space(height: 36),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 75.0),
            child: CupertinoButton(
              onPressed: () => ShareService.share(text: "Share", linkUrl: "https://unimastery.com/"),
              padding: EdgeInsets.zero,
              child: Container(
                height: 42,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(52),
                  color: UIColor.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.0),
                      child: Icon(
                        Icons.share,
                        color: UIColor.unitedNationsBlue,
                        size: 18,
                      ),
                    ),
                    Label(
                      text: "share your Workshop",
                      weight: FontWeight.w700,
                      size: 12,
                      color: UIColor.unitedNationsBlue,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
