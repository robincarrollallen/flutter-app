import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '/model/dto/lobby_sidebar_banner_list_model.dart';
import '/theme/variables/custom.dart';
import '/utils/screen.dart';
import 'logic.dart';

class DrawerActivityView extends StatelessWidget {
  DrawerActivityView({ super.key });

  final logic = Get.put(DrawerActivityLogic());
  final state = Get.find<DrawerActivityLogic>().state;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<CustomColors>(); // 主题颜色<扩展>

    return GetBuilder<DrawerActivityLogic>(
      builder: (_) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0.rem()),
              child: Text('Top Picks'),
            ),
            GridView.count(
              crossAxisCount: 2,            // 两列
              mainAxisSpacing: 12.0.rem(),  // 垂直间距
              crossAxisSpacing: 12.rem(),   // 水平间距
              shrinkWrap: true,             // 让 GridView 高度自适应
              childAspectRatio: 2,
              physics: NeverScrollableScrollPhysics(), // 禁止内部滚动
              children: state.sidebarActivityList.map((item) {
                final iconUrl = item.iconUrlType == IconUrlType.DEFAULT ? item.defaultIconUrl : item.customIconUrl;

                return Container(
                  padding: EdgeInsets.all(5.0.rem()),
                  decoration: BoxDecoration(
                    color: colors?.surfaceRaisedL2,
                    borderRadius: BorderRadius.circular(6.0.rem()),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(4.0.rem()),
                        child: Row(
                          spacing: 4.0.rem(),
                          children: [
                            Image.network(
                              '$iconUrl',
                              width: 24.0.rem(),
                              height: 24.0.rem(),
                              fit: BoxFit.cover,
                            ),
                            Expanded(
                              child:Text(
                                '${item.name}',
                                style: TextStyle(fontSize: 12.0.rem(), fontWeight: FontWeight.w600),
                                maxLines: 1,                      // 最多显示一行
                                softWrap: false,                  // 禁止自动换行
                                overflow: TextOverflow.ellipsis,  // 超出部分显示省略号
                              )
                            )
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: TextButton(
                          onPressed: (){ print('>>>>>>>>>>>>> ${item.name}'); },
                          style: ButtonStyle(
                            minimumSize: WidgetStateProperty.all(Size.zero),
                            padding: WidgetStateProperty.all(EdgeInsets.zero),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10.0.rem(), vertical: 2.0.rem()),
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
                              border: Border.all(color: colors?.borderBrand ?? Colors.transparent),
                              borderRadius: BorderRadius.circular(6.0.rem())
                            ),
                            child: Text('GO !', style: TextStyle(fontSize: 10.0.rem(), color: colors?.textDefault, fontWeight: FontWeight.w600)),
                          )
                        ),
                      )
                    ],
                  ),
                );
              }).toList(),
            )
          ]
        );
      }
    );
  }
}