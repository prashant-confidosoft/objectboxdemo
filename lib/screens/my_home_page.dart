import 'package:flutter/material.dart';
import 'package:flutter_template/baseClass/base_view.dart';
import 'package:flutter_template/bloc/login_bloc.dart';
import 'package:flutter_template/database/database_entity.dart';
import 'package:flutter_template/main.dart';
import 'package:flutter_template/model/member/members.dart';

class MyHomePage extends BaseView {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends BaseViewState<MyHomePage> with BasePage {
  int _counter = 0;
  final LoginBloc _loginBloc = LoginBloc();
  var listMembers = <PageSamiti>[];

  @override
  Widget body() {
    var listMember = objectbox.dataBaseMemberBox.getAll();
    return ListView.builder(
      itemCount: listMember.length,
      itemBuilder: (context, index) {
        var element = listMember[index];
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Name : ${element.name} Index: $index',
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void initBaseState() {
    leftAppBarButton = LeftAppBarButton.Empty;
    // _loginBloc.getPageSamiti();

    // _loginBloc.errorSubject.listen((error) {
    //   showErrorMessage(error, scaffoldKey.currentState!);
    // });

    // _loginBloc.isLoading.listen((value) {
    //   if (value) {
    //     showIndicator('Loading...', scaffoldKey.currentState!);
    //   } else {
    //     hideIndicator(scaffoldKey.currentState!);
    //   }
    // });

    var data = objectbox.dataBaseMemberBox.getAll();
    print(data[0]);

    _loginBloc.pageSamitiResponse.listen((value) {
      listMembers = value.data?.pageSamiti ?? <PageSamiti>[];
      saveLocalData();
    });
  }

  void saveLocalData() async {
    try {
      for (var i = 0; i < listMembers.length; i++) {
        var elemet = listMembers[i];
        var member = DataBaseMember();

        member.pageNo = elemet.pageNo;
        member.boothNo = elemet.boothNo;
        member.name = elemet.name;
        member.address = elemet.address;
        member.contactNo = elemet.contactNo;
        member.designation = elemet.designation;
        member.vaccineStatus = 'No';
        member.vidhansabha = elemet.vidhansabha;
        member.ward = elemet.ward;
        member.shaktikendra = elemet.shaktikendra;
        member.shaktikendraMobile = elemet.shaktikendraMobile;
        member.incharge = elemet.incharge;
        member.inchargeMobile = elemet.inchargeMobile;
        member.createdAt = elemet.createdAt;
        member.updatedAt = elemet.updatedAt;
        objectbox.dataBaseMemberBox.put(member);
      }
      setState(() {});
    } catch (e) {
      print(e.toString());
    }
  }
}
