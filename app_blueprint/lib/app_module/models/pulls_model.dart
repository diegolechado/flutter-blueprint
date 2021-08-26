class PullsModel {
    String url;
    int id;
    int number;
    String state;
    bool locked;
    String title;
    String? body;
    String commits_url;
    String diff_url;
    String created_at;
    String? closed_at;
    String? merged_at;
    UserModel user;
    Duration? differenceTime;

    PullsModel({
        required this.url,
        required this.id,
        required this.number,
        required this.state,
        required this.locked,
        required this.title,
        this.body,
        required this.commits_url,
        required this.diff_url,
        required this.created_at,
        this.closed_at,
        this.merged_at,
        required this.user
    });

    static PullsModel fromMap(Map<String, dynamic> json) {
        return PullsModel(
            url: json['url'],
            id: json['id'],
            number: json['number'],
            state: json['state'],
            locked: json['locked'],
            title: json['title'],
            body: json['body'],
            commits_url: json['commits_url'],
            diff_url: json['diff_url'],
            created_at: json['created_at'],
            closed_at: json['closed_at'],
            merged_at: json['merged_at'],
            user: UserModel.fromMap(json['user'])
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = Map<String, dynamic>();
        data['url'] = this.url;
        data['id'] = this.id;
        data['number'] = this.number;
        data['state'] = this.state;
        data['locked'] = this.locked;
        data['title'] = this.title;
        data['body'] = this.body;
        data['commits_url'] = this.commits_url;
        data['diff_url'] = this.diff_url;
        data['created_at'] = this.created_at;
        data['closed_at'] = this.closed_at;
        data['merged_at'] = this.merged_at;
        data['user'] = this.user.toJson();
        return data;
    }
}

class UserModel {
    String login;
    String avatar_url;

    UserModel({
        required this.login,
        required this.avatar_url,
    });

    static UserModel fromMap(Map<String, dynamic> json) {
        return UserModel(
            login: json['login'],
            avatar_url: json['avatar_url']
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = Map<String, dynamic>();
        data['login'] = this.login;
        data['avatar_url'] = this.avatar_url;
        return data;
    }
}