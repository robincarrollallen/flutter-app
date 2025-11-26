import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(TabPersonalLogic());
    final state = Get.find<TabPersonalLogic>().state;

    return GetBuilder<TabPersonalLogic>(builder: (logic) {
      return Scaffold(
          body: Stack(
            children: [
              MediaQuery.removePadding(       /// 去除边距组件
                  removeTop: true,              /// 去除上边距(安全区)
                  context: context,
                  child: NotificationListener(  /// 监听内容滚动部件
                      onNotification: (scrollNotification) {
                        /// 判断滚动是否大于0 && 是否第一层部件滚动
                        if(scrollNotification is ScrollUpdateNotification && scrollNotification.depth == 0) {
                          logic.onScroll(scrollNotification.metrics.pixels); /// 触发滚动事件(自定义)
                          return false;
                        }
                        return true;
                      },
                      child: ListView(
                          children: <Widget>[
                            Container(
                                height: 260,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.bottomLeft,			/// 渐变开始位置
                                        end: Alignment.topRight,				  /// 渐变结束位置
                                        colors: [													/// 具体颜色
                                          Color(0xFFFF7D75),
                                          Color(0xFFFFA463),
                                        ],
                                        stops: [-0.73, 1.0107]									/// 结束点
                                    )
                                ),
                                child: Padding(
                                    padding: EdgeInsets.all(20),
                                    child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text('我的',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold)),
                                              Row(
                                                children: [
                                                  Image.asset('assets/images/personal/customerIcon.png',width: 20,height: 20,),
                                                  SizedBox(width: 10),
                                                  Image.asset('assets/images/personal/chatIcon.png',width:20,height:20)
                                                ],
                                              )
                                            ],
                                          ),
                                          SizedBox(height: 20),
                                          Row(
                                            children: [
                                              Container(
                                                height: 70.0,
                                                width: 70.0,
                                                margin:const EdgeInsets.only(right: 15.0),
                                                child:const CircleAvatar(backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS5oSxm3IhiX7VwmnVo01urvZ7hNlP1M6YVtZiiRDU&s')),
                                              ),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text('586683213',style: TextStyle(color: Colors.white)),
                                                  Row(
                                                    children: [
                                                      Text('邀请码: ',style: TextStyle(color: Colors.white)),
                                                      Image.asset('assets/images/personal/copyDuplicate.png',width:16,height:16)
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Image.asset('assets/images/personal/phoneSuccess_b.png',width:16,height:16),
                                                      Image.asset('assets/images/personal/contacts_b.png',width:16,height:16),
                                                      Image.asset('assets/images/personal/bankCard_b.png',width:16,height:16),
                                                      Image.asset('assets/images/personal/mailSend_b.png',width:16,height:16)
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ]
                                    )
                                )
                            ),
                            Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Container(),
                                Positioned(
                                    width: MediaQuery.of(context).size.width,
                                    top: -100,
                                    child: Column(
                                      children: [
                                        Card(
                                            surfaceTintColor: Colors.white,
                                            elevation: 8,
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                                            margin: EdgeInsets.fromLTRB(10,0,10,20),
                                            child: Padding(
                                              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Text('总资产',style:TextStyle(fontSize: 18)),
                                                          SizedBox(width: 14),
                                                          Text('CNY',style:TextStyle(fontSize: 18,color: Color(0xFF7A7A7A))),
                                                          SizedBox(width: 2),
                                                          Image.asset('assets/images/icon/eyeClose.png',width:20,height:20)
                                                        ],
                                                      ),
                                                      Image.asset('assets/images/personal/infoIcon.png',width:26,height:26)
                                                    ],
                                                  ),
                                                  SizedBox(height: 20),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text('¥ ' + '0',style:TextStyle(fontSize: 30,fontWeight: FontWeight.bold)),
                                                      Row(
                                                        children: [
                                                          Image.asset('assets/images/personal/percentIcon.png',width:26,height:26),
                                                          SizedBox(width: 8),
                                                          Text('持仓盈亏')
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                  SizedBox(height: 20),
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        child: Column(
                                                          children: [
                                                            Text('账户余额',style:TextStyle(fontSize: 16,color: Color(0xFF7A7A7A))),
                                                            Text('0',style:TextStyle(fontSize: 16,color: Color(0xFF7A7A7A)))
                                                          ],
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Column(
                                                          children: [
                                                            Text('合约价值',style:TextStyle(fontSize: 16,color: Color(0xFF7A7A7A))),
                                                            Text('0',style:TextStyle(fontSize: 16,color: Color(0xFF7A7A7A)))
                                                          ],
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Column(
                                                          children: [
                                                            Text('现金券',style:TextStyle(fontSize: 16,color: Color(0xFF7A7A7A))),
                                                            Text('0',style:TextStyle(fontSize: 16,color: Color(0xFF7A7A7A)))
                                                          ],
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Column(
                                                          children: [
                                                            Text('利息券',style:TextStyle(fontSize: 16,color: Color(0xFF7A7A7A))),
                                                            Text('0',style:TextStyle(fontSize: 16,color: Color(0xFF7A7A7A)))
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            )
                                        )
                                      ],
                                    )
                                )
                              ],
                            ),
                            Card(
                                elevation: 8,
                                surfaceTintColor: Colors.white,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                                margin: EdgeInsets.fromLTRB(10,94,10,20),
                                child: Padding(
                                    padding: EdgeInsets.fromLTRB(0,20,0,20),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            children: [
                                              Image.asset('assets/images/personal/rechargeIcon.png',width:40,height:40),
                                              Text('充值')
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: GestureDetector(
                                            onTap: (){
                                              final int timestamp = DateTime.now().millisecondsSinceEpoch;
                                              Get.toNamed(
                                                  '/addWithdrawAccount/$timestamp', arguments: { timestamp: '$timestamp' }
                                              );
                                            },
                                            child: Column(
                                              children: [
                                                Image.asset('assets/images/personal/withDrawIcon.png',width:40,height:40),
                                                Text('提现')
                                              ],
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            children: [
                                              Image.asset('assets/images/personal/agentIcon.png',width:40,height:40),
                                              Text('代理中心')
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            children: [
                                              Image.asset('assets/images/personal/fundingIcon.png',width:40,height:40),
                                              Text('资金明细')
                                            ],
                                          ),
                                        )
                                      ],
                                    )
                                )
                            ),
                            Card(
                                elevation: 8,
                                surfaceTintColor: Colors.white,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                                margin: EdgeInsets.fromLTRB(10,0,10,20),
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(bottom: 10,top: 10),
                                        decoration: BoxDecoration(
                                            border: Border(bottom: BorderSide(width: 1, color: Color.fromRGBO(0, 0, 0, 0.13)))
                                        ),
                                        child: GestureDetector(
                                          onTap: (){ Get.snackbar(
                                              'SnackBar',
                                              '这是GetX的SnackBar'
                                          );},
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Image.asset('assets/images/personal/signIcon.png',width:17,height:17),
                                              SizedBox(width: 5),
                                              Expanded(child: Text('每日签到')),
                                              Image.asset('assets/images/personal/goIcon.png',height:17),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(bottom: 10,top: 10),
                                        decoration: BoxDecoration(
                                            border: Border(bottom: BorderSide(width: 1, color: Color.fromRGBO(0, 0, 0, 0.13)))
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Image.asset('assets/images/personal/taskIcon.png',width:17,height:17),
                                            SizedBox(width: 5),
                                            Expanded(child: Text('任务中心')),
                                            Image.asset('assets/images/personal/goIcon.png',height:17),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(bottom: 10,top: 10),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Image.asset('assets/images/personal/activeIcon.png',width:17,height:17),
                                            SizedBox(width: 5),
                                            Expanded(child: Text('活动中心')),
                                            Image.asset('assets/images/personal/goIcon.png',height:17),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )
                            ),
                            Card(
                                elevation: 8,
                                surfaceTintColor: Colors.white,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                                margin: EdgeInsets.fromLTRB(10,0,10,20),
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(bottom: 10,top: 10),
                                        decoration: BoxDecoration(
                                            border: Border(bottom: BorderSide(width: 1, color: Color.fromRGBO(0, 0, 0, 0.13)))
                                        ),
                                        child: GestureDetector(
                                          behavior: HitTestBehavior.translucent,
                                          onTap: () {
                                            Get.toNamed('security');
                                          },
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Image.asset('assets/images/personal/lookIcon.png',width:17,height:17),
                                              SizedBox(width: 5),
                                              Expanded(child: Text('账号与安全')),
                                              Image.asset('assets/images/personal/goIcon.png',height:17),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(bottom: 10,top: 10),
                                        decoration: BoxDecoration(
                                            border: Border(bottom: BorderSide(width: 1, color: Color.fromRGBO(0, 0, 0, 0.13)))
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Image.asset('assets/images/personal/helpIcon.png',width:17,height:17),
                                            SizedBox(width: 5),
                                            Expanded(child: Text('帮助中心')),
                                            Image.asset('assets/images/personal/goIcon.png',height:17),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(bottom: 10,top: 10),
                                        decoration: BoxDecoration(
                                            border: Border(bottom: BorderSide(width: 1, color: Color.fromRGBO(0, 0, 0, 0.13)))
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Image.asset('assets/images/personal/settingIcon.png',width:17,height:17),
                                            SizedBox(width: 5),
                                            Expanded(child: Text('通用设置')),
                                            Image.asset('assets/images/personal/goIcon.png',height:17),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(bottom: 10,top: 10),
                                        child: GestureDetector(
                                          behavior: HitTestBehavior.translucent,
                                          onTap: () {
                                            Get.toNamed('about');
                                          },
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Image.asset('assets/images/personal/myIcon.png',width:17,height:17),
                                              SizedBox(width: 5),
                                              Expanded(child: Text('关于')),
                                              Image.asset('assets/images/personal/goIcon.png',height:17),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                            )
                          ]
                      )
                  )
              ),
              Opacity(
                  opacity: state.appBarAlpha,
                  child: Column(
                    children: [
                      AppBar(
                          centerTitle: true,
                          title: Text('个人中心')
                      )
                    ],
                  )
              )
            ],
          )
      );
    });
  }
}
