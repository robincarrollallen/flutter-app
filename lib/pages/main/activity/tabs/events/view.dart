import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '/theme/variables/custom.dart';
import '/components/shiny_button.dart';
import '/enums/default.dart';
import '/utils/screen.dart';
import 'logic.dart';

class EventsListView extends StatelessWidget {
  EventsListView({ super.key });

  final logic = Get.lazyPut<EventsLogic>(() => EventsLogic());
  final state = Get.find<EventsLogic>().state;

  @override
  Widget build(BuildContext context) {

    return GetBuilder<EventsLogic>(builder: (_) {
      final colors = Theme.of(context).extension<CustomColors>(); // 主题颜色<扩展>

      return ListView.builder(
        padding: EdgeInsets.only(
          top: 10.0.rem(),
          left: 10.0.rem(),
          right: 10.0.rem(),
          bottom: MediaQuery.of(context).padding.bottom,
        ),
        itemCount: state.activityList.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              ShinyButton(
                padding: EdgeInsets.zero,
                child: Container(
                  height: 120.0.rem(),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(state.activityList[index].bannerBackground ?? DEFAULT.STRING.value),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(6.0.rem()), topRight: Radius.circular(6.0.rem()))
                  ),
                  child: Padding(
                    padding: EdgeInsetsGeometry.symmetric(vertical: 10.0.rem(), horizontal: 16.0.rem()),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(''),
                        ),
                        Image.network(state.activityList[index].bannerLogo ?? DEFAULT.STRING.value),
                      ],
                    ),
                  )
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      state.activityList[index].name ?? DEFAULT.STRING.value,
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.0.rem()),
                    )
                  ),
                  TextButton(
                    onPressed: () {
                      print('>>>>>>>>>>>>> ${state.activityList[index].name}');
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 2.0.rem(), bottom: 10.0.rem()),
                      padding: EdgeInsets.symmetric(horizontal: 16.0.rem(), vertical: 8.0.rem()),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            colors?.gradientsPrimaryA ?? Colors.blue,
                            colors?.gradientsPrimaryB ?? Colors.lightBlue,
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          stops: const [-0.27, 1.27],
                        ),
                          borderRadius: BorderRadius.circular(4.0.rem())
                      ),
                      child: Text('In Progress', style: TextStyle(fontSize: 14.0.rem(), color: colors?.textDefault, fontWeight: FontWeight.w600)),
                    )
                  )
                ],
              )
            ]
          );
        },
      );
    });
  }
}