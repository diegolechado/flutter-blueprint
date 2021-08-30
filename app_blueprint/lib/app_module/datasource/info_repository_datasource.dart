import 'package:app_blueprint/app_module/models/pulls_model.dart';
import 'package:app_blueprint/app_module/models/repos_model.dart';
import 'package:app_blueprint/app_module/datasource/connect_datasource.dart';

abstract class InfoRepositoryDatasource {
    Future<List<ReposModel>> retrieveListRepositoriesByUserToken({required String token, required int page});

    Future<List<PullsModel>> retrieveListPullsByRepository(String url);
}

class GitHubDatasource implements InfoRepositoryDatasource {
    final ConnectDatasource dioConnect;

    GitHubDatasource({required this.dioConnect});

    @override
    Future<List<ReposModel>> retrieveListRepositoriesByUserToken({required String token, required int page}) async {
        dioConnect.setDioOptions(interceptorHeaders: {
            'Authorization': 'token $token'
        });

        final response = await dioConnect.request(
            method: HttpMethod.get,
            path: "https://api.github.com/user/repos?per_page=100&page=$page"
        );

        if(response.statusCode == 200) {
            final jsonList = response.data as List;
            List<ReposModel> list = [];
            jsonList.forEach((i) => list.add(ReposModel.fromMap(i)));
            return list;
        }
        else
            throw Exception();
    }

    @override
    Future<List<PullsModel>> retrieveListPullsByRepository(String url) async {
        final response = await dioConnect.request(
            method: HttpMethod.get,
            path: "$url/pulls?state=all&per_page=100"
        );

        if(response.statusCode == 200) {
            final jsonList = response.data as List;
            List<PullsModel> list = [];
            jsonList.forEach((i) => list.add(PullsModel.fromMap(i)));
            return list;
        }
        else
            throw Exception();
    }
}