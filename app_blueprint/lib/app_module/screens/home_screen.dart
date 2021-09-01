import 'package:app_blueprint/app_module/blocs/home/home_bloc.dart';
import 'package:app_blueprint/app_module/models/repos_model.dart';
import 'package:app_blueprint/design_system/widgets/app_bar.dart';
import 'package:app_blueprint/design_system/widgets/button.dart';
import 'package:app_blueprint/design_system/colors.dart';
import 'package:app_blueprint/design_system/font.dart';
import 'package:app_blueprint/design_system/widgets/search_box.dart';
import 'package:app_blueprint/design_system/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeBloc _homeBloc = Modular.get<HomeBloc>();
  List<ReposModel> _listSearchResult = [];
  bool _visible = false;

  @override
  void initState() {
      _homeBloc.add(StartEventHome());
      super.initState();
  }

  @override
  void dispose() {
      _homeBloc.close();
      super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: DSAppBar(
            title: "Home",
            actions: [
              IconButton(
                  icon: Icon(Icons.settings),
                  onPressed: () => Navigator.pushNamed(context, "/settings")
              )
            ]
        ),
        body: SafeArea(
            child: BlocBuilder(
                bloc: _homeBloc,
                builder: (context, state) {
                    if(state is FailureStateHome)
                        return Padding(
                            padding: EdgeInsets.all(DSSpacing.m),
                            child: Column(
                                children: [
                                    Center(
                                        child: Text(
                                            state.message,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontFamily: DSFontFamily.GothamMedium,
                                                fontSize: DSFontSize.l,
                                                color: DSColors.black
                                            )
                                        )
                                    ),
                                    DSButton(
                                        title: "Recarregar",
                                        colorProfile: ColorProfileEnum.black,
                                        onPressed: () => _homeBloc.add(StartEventHome()),
                                        marginTop: DSSpacing.l
                                    )
                                ]
                            )
                        );
                    else if(state is SuccessStateHome)
                        return buildSuccess(_visible ? _listSearchResult : state.list);
                    else
                        return Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            child: Center(
                                child: Container(
                                    width: 50,
                                    height: 50,
                                    child: CircularProgressIndicator(
                                        strokeWidth: 2.4,
                                        color: DSColors.black,
                                        backgroundColor: DSColors.backgroundGrey
                                    )
                                )
                            )
                        );
                }
            )
        ),
        floatingActionButton: BlocBuilder(
            bloc: _homeBloc,
            builder: (context, state) {
                if(state is SuccessStateHome)
                    return FloatingActionButton.extended(
                        onPressed: () => _homeBloc.add(StartEventHome()),
                        icon: Icon(
                            Icons.download_outlined,
                            color: DSColors.white,
                            size: 20
                        ),
                        label: Text(
                            "Carregar mais",
                            style: TextStyle(fontSize: DSFontSize.s),
                        ),
                        backgroundColor: DSColors.black
                    );
                else
                  return Container();
            }
        )
    );
  }

  Widget buildSuccess(List<ReposModel> list) {
      return ListView(
          padding: EdgeInsets.all(DSSpacing.m),
          children: [
              DSSearchBox(
                  placeholder: "Repository name",
                  onSearch: (String text) {
                      _listSearchResult.clear();

                      if(text.isEmpty) {
                          setState(() {
                              _visible = false;
                          });
                          return;
                      }

                      list.forEach((item) {
                          if(item.name.contains(text))
                              _listSearchResult.add(item);
                      });

                      setState(() {
                          _visible = true;
                      });
                  }
              ),
              SizedBox(height: DSSpacing.l),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: List.generate(
                      list.length,
                      (i) => buildItem(list[i])
                  )
              )
          ]
      );
  }

  Widget buildItem(ReposModel repo) {
      return GestureDetector(
          onTap: () => Navigator.pushNamed(
              context,
              "/pulls",
              arguments: {
                "name": repo.name,
                "url": repo.url
              }
          ),
          child: Container(
              margin: EdgeInsets.symmetric(vertical: DSSpacing.s),
              color: DSColors.backgroundGrey,
              height: 50,
              child: Row(
                  children: [
                      Container(color: DSColors.black, width: 2),
                      SizedBox(width: DSSpacing.xs),
                      Text(
                          repo.name,
                          style: TextStyle(
                              fontFamily: DSFontFamily.GothamMedium,
                              color: DSColors.black,
                              fontSize: DSFontSize.m
                          )
                      )
                  ]
              )
          )
      );
  }
}