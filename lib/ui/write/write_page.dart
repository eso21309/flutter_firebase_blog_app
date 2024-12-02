import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WritePage extends StatefulWidget {
  @override
  State<WritePage> createState() => _WritePageState();
}

class _WritePageState extends State<WritePage> {
  //제목, 작성자, 내용
  TextEditingController writeController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  //Form 위젯 사용하기 위해 글로벌키 넣어줘야함. Validation 체크를 위함
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    writeController.dispose();
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //키보드가 올라와있을 때 화면의 다른 부분을 터치하면 키보드를 내리는(숨기는) 기능
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          actions: [
            GestureDetector(
              onTap: () {
                print("완료되는지 콘솔에서 항상 확인해");
                //탭했을때 Validation 체크 해야함
                final result = formKey.currentState?.validate() ?? false;
                //Body Form에도 'key: formKey,'를 넣어줘야 작동함
              },
              child: Container(
                width: 50,
                height: 50,
                color: Colors.transparent,
                alignment: Alignment.center,
                child: Text(
                  "완료",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
        body: Form(
          key: formKey,
          //TextForm 쓰려면 바디를 Form으로 전체 씌워야함
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 16),
            //패딩을 자동완성으로 씌우지않고 따로 입력해도 됨
            children: [
              TextFormField(
                controller: writeController,
                textInputAction: TextInputAction.done, //키보드 액션 버튼의 텍스트
                decoration: InputDecoration(hintText: "작성자"),
                validator: (value) {
                  //trim : 문자열 앞 뒤로 공백 제거
                  if (value?.trim().isEmpty ?? true) {
                    return "작성자를 입력해 주세요";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: titleController,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(hintText: "제목"),
                validator: (value) {
                  if (value?.trim().isEmpty ?? true) {
                    return "제목을 입력해 주세요";
                  }
                  return null;
                },
              ),
              Container(
                height: 200, //높이값 주고 expands 속성 true로 넣어주기
                child: TextFormField(
                  //TextArea의 높이값을 주기 위해 TextFormField를 컨테이너로 가싸주기
                  controller: contentController,
                  maxLines: null,
                  expands: true, //높이 늘릴때 반드시 설정
                  textInputAction: TextInputAction.newline,
                  //newline으로 변경하고
                  //MaxLine 속성 null 넣어주면 엔터해서 줄내리기 가능
                  decoration: InputDecoration(hintText: "내용"),
                  validator: (value) {
                    if (value?.trim().isEmpty ?? true) {
                      return "내용을 입력해 주세요";
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 24),
              //컨테이너 만들면 부모 속성 따라가므로 Align으로 씌워주어야함 //alignment 속성 사용
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  //1. Container로 먼저 도형 만들기
                  width: 100,
                  height: 100,
                  color: Colors.grey[300],
                  child: Icon(
                    Icons.image,
                    color: Colors.grey[600],
                  ),
                  //2. Container 안에 아이콘 넣고 싶으면 child 속성에 Icon 넣기
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
