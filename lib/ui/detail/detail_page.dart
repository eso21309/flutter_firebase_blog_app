import 'package:flutter/material.dart';
import 'package:flutter_firebase_blog_app/ui/write/write_page.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            iconButton(Icons.delete, () {
              print("삭제 아이콘 터치됨");
            }),
            //(){} >>>> "아무것도 안 할거야"라는 의미의 빈 함수
            //실 사용시, onTap을 안넣는 이유는 순서대로 작업하기 때문에 자동으로 인식해서이다.
            iconButton(Icons.edit, () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return WritePage();
                },
              ));
            }),
          ],
        ),
        body: ListView(
          children: [
            AspectRatio(
              //레이아웃을 깨지 않는 선에서 이미지 비율로 높이값 정하기 :
              //AspectRatio로 감싸고 aspectRation 속성 입력해주면 끝!
              aspectRatio: 1 / 1.2,
              child: Image.network(
                "https://picsum.photos/seed/picsum/200/300",
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: 16, bottom: 24, left: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Today I learned",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "홍승현",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[700],
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "2024.12.02",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Flutter 그리드 뷰를 배웠습니다." * 20, //글자 반복숫자 넣어주기 오!
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey[800],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  //일단 코드 전체를 작성하고 공통 메소드로 만들면 젤 하단에 메소드 코드가 생기지만
  //build 함수 밖에 공통 메소드를 처음부터 만들고 사용해도 되는 것임
  //widget 파일로 분리해서 관리해도 됨 //여러 파일에서 사용되면 공통 widget으로 관리

  //(IconData icon, void Function() onTap) >>>
  //어떤 아이콘을 쓸지, 눌렀을때 어떤 기능을 할지 콜백함수와 함께 파라미터로 쓰인다.//

  Widget iconButton(IconData icon, void Function() onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        //아이콘을 컨테이너로 감싸고 투명도 줘서 터치영역 만든다.
        width: 48,
        height: 48,
        color: Colors.transparent,
        child: Icon(icon),
      ),
    );
  }
}
