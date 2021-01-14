import 'package:flutter/material.dart';
import 'decontamination_widget.dart';
import 'package:get/get.dart';
import 'package:flutter_demo/Config/Routes/RoutesManage.dart';


class DecontaminationPage extends StatefulWidget{
  @override
  _DecontaminationPageState  createState() => _DecontaminationPageState();
}

class _DecontaminationPageState extends State<DecontaminationPage>{

  static const Color appThemColor = Color(0xff113a70);
  static const TextStyle appButtonThemColor = TextStyle(color: Colors.white,fontSize: 19,fontWeight: FontWeight.bold);
  var constructionData = [
                  {"title": "机器码UPN","content" :"H&491LAB100C27Z0","style":DecontaminationCellStyle.record},
                  {"title": "Description","content" :"i-Lab CART System Zeron","style":DecontaminationCellStyle.descrpotion},
                  {"title": "机器番号","content" :"10086","hintText":"扫码填入","style":DecontaminationCellStyle.record},
                  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appThemColor,
        title: Text("Boston\nScientific",style: TextStyle(color: Colors.white),textAlign: TextAlign.center),
        centerTitle: true,
      ),
      body:  Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
                child: ListView.builder(
                  itemCount: constructionData.length,
                  itemBuilder: (c, i) =>
                        DecontaminationItems(
                          model: constructionData[i],
                     ),
                )
            ),
            ///下面控件位于Column布局底部
            Container(
              color: Colors.white,
              padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end, //平均分配
                children: <Widget>[
                  SizedBox(
                    width: (MediaQuery.of(context).size.width - 30)/2,
                    height: 44,
                    child:  RaisedButton(
                      color: appThemColor,
                      child: Text('检测',style: appButtonThemColor),
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Colors.white,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8)),
                      onPressed: () {
                        Get.toNamed(Routes.DecontaminationUpdatePage);
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      //bodyListView(context),
    );
  }
}

