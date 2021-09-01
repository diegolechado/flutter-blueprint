import 'package:app_blueprint/app_module/blocs/settings/settings_bloc.dart';
import 'package:app_blueprint/design_system/widgets/app_bar.dart';
import 'package:app_blueprint/design_system/widgets/button.dart';
import 'package:app_blueprint/design_system/colors.dart';
import 'package:app_blueprint/design_system/font.dart';
import 'package:app_blueprint/design_system/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SettingsScreen extends StatelessWidget {
  final SettingsBloc _settingsBloc = Modular.get<SettingsBloc>();
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return BlocListener(
        bloc: _settingsBloc,
        listener: (BuildContext context, SaveEnum state) {
            if (state == SaveEnum.save)
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text(
                            'Salvo com sucesso!',
                            style: TextStyle(
                                fontFamily: DSFontFamily.GothamRegular,
                                color: DSColors.white,
                                fontSize: DSFontSize.s
                            )
                        ),
                        backgroundColor: DSColors.black
                    ));
          },
        child: Scaffold(
            appBar: DSAppBar(title: "Settings"),
            body: SafeArea(
                child: Padding(
                    padding: EdgeInsets.all(DSSpacing.m),
                    child: Column(
                        children: [
                          TextFormField(
                              decoration: InputDecoration(labelText: "API Token"),
                              controller: _controller,
                              focusNode: _focusNode
                          ),
                          SizedBox(height: DSSpacing.l),
                          BlocBuilder(
                              bloc: _settingsBloc,
                              builder: (context, state) {
                                  if(state == SaveEnum.loading)
                                      return Center(
                                          child: Container(
                                              width: 45,
                                              height: 45,
                                              child: CircularProgressIndicator(
                                                  strokeWidth: 2.4,
                                                  color: DSColors.black,
                                                  backgroundColor: DSColors.backgroundGrey
                                              )
                                          )
                                      );
                                  else
                                      return DSButton(
                                          title: "Salvar",
                                          colorProfile: ColorProfileEnum.black,
                                          onPressed: () {
                                              if(_controller.text != "") {
                                                  _focusNode.unfocus();
                                                  _settingsBloc.add(_controller.text);
                                              }
                                          }
                                      );
                              }
                          )
                        ]
                    )
                )
            )
        )
    );
  }
}