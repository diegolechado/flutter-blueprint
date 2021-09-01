import 'package:app_blueprint/app_module/blocs/pulls/pulls_bloc.dart';
import 'package:app_blueprint/app_module/models/pulls_model.dart';
import 'package:app_blueprint/design_system/widgets/app_bar.dart';
import 'package:app_blueprint/design_system/colors.dart';
import 'package:app_blueprint/design_system/font.dart';
import 'package:app_blueprint/design_system/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PullsScreen extends StatefulWidget {
    final String name;
    final String url;

    const PullsScreen({
        required this.name,
        required this.url, Key? key}) : super(key: key);

  @override
  _PullsScreenState createState() => _PullsScreenState();
}

class _PullsScreenState extends State<PullsScreen> {
    final PullsBloc _pullsBloc = Modular.get<PullsBloc>();

    @override
    void initState() {
        _pullsBloc.add(StartEventPulls(url: widget.url));
        super.initState();
    }

    @override
    void dispose() {
        _pullsBloc.close();
        super.dispose();
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: DSAppBar(title: widget.name),
            body: SafeArea(
                child: BlocBuilder(
                    bloc: _pullsBloc,
                    builder: (context, state) {
                        if(state is FailureStatePulls)
                            return Padding(
                                padding: EdgeInsets.all(DSSpacing.m),
                                child: Center(
                                    child: Text(
                                        state.message,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontFamily: DSFontFamily.GothamMedium,
                                            fontSize: DSFontSize.l,
                                            color: DSColors.black
                                        )
                                    )
                                )
                            );
                        else if(state is SuccessStatePulls)
                            return buildSuccess(state.listPullsModel);
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
            )
        );
    }

    Widget buildSuccess(List<PullsModel> listPullsModel) => SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(DSSpacing.m),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: List.generate(
                    listPullsModel.length,
                    (i) => buildItem(listPullsModel[i])
                )
            )
        )
    );

    Widget buildItem(PullsModel pullsModel) => Container(
          height: 236,
          color: DSColors.backgroundGrey,
          margin: EdgeInsets.symmetric(vertical: DSSpacing.s),
          child: Row(
              children: [
                  Container(color: DSColors.black, width: 2),
                  Expanded(
                      child: Container(
                          padding: EdgeInsets.all(DSSpacing.s),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                  Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                          ClipOval(
                                              child: Image.network(
                                                  pullsModel.user.avatar_url,
                                                  width: 50,
                                                  height: 50
                                              )
                                          ),
                                          SizedBox(width: 20),
                                          Expanded(
                                              child: Text(
                                                  '${pullsModel.user.login}',
                                                  style: TextStyle(
                                                      fontFamily: DSFontFamily.GothamMedium,
                                                      fontSize: DSFontSize.l,
                                                      color: DSColors.black
                                                  )
                                              )
                                          )
                                      ]
                                  ),
                                  SizedBox(height: DSSpacing.s),
                                  Text(
                                      'Title: ${pullsModel.title}',
                                      style: TextStyle(
                                          fontFamily: DSFontFamily.GothamRegular,
                                          fontSize: DSFontSize.m,
                                          color: DSColors.black
                                      )
                                  ),
                                  SizedBox(height: DSSpacing.xs),
                                  Text(
                                      'Status: ${pullsModel.state}',
                                      style: TextStyle(
                                          fontFamily: DSFontFamily.GothamRegular,
                                          fontSize: DSFontSize.m,
                                          color: DSColors.black
                                      )
                                  ),
                                  SizedBox(height: DSSpacing.xs),
                                  Text(
                                      'Abertura: ${formatDate(pullsModel.created_at)}',
                                      style: TextStyle(
                                          fontFamily: DSFontFamily.GothamRegular,
                                          fontSize: DSFontSize.m,
                                          color: DSColors.black
                                      )
                                  ),
                                  SizedBox(height: DSSpacing.xs),
                                  Text(
                                      'Fechamento: ${formatDate(pullsModel.closed_at)}',
                                      style: TextStyle(
                                          fontFamily: DSFontFamily.GothamRegular,
                                          fontSize: DSFontSize.m,
                                          color: DSColors.black
                                      )
                                  ),
                                  SizedBox(height: DSSpacing.s),
                                  pullsModel.differenceTime != null
                                  ? Text(
                                      getTimeString(pullsModel.differenceTime!.inMinutes),
                                      style: TextStyle(
                                          fontFamily: DSFontFamily.GothamMedium,
                                          color: DSColors.black,
                                          fontSize: DSFontSize.m,
                                          fontWeight: FontWeight.bold
                                      )
                                  )
                                  : Container()
                              ]
                          )
                      )
                  )
              ]
          )
      );

    String getTimeString(int value) {
        final int hour = value ~/ 60;
        final int minutes = value % 60;
        return 'Ficou ${hour.toString().padLeft(2, "0")} horas e ${minutes.toString().padLeft(2, "0")} minutos aberto';
    }

    String formatDate(String? value) {
        if(value == null)
            return "--/--/----";

        final x = value.split("T");
        final data = x[0].split("-");
        final hora = x[1].replaceAll("Z", "");

        return "${data[2]}/${data[1]}/${data[0]} às $hora";
    }
}