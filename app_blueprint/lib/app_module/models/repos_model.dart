class ReposModel {
  int id;
  String name;
  String fullName;
  bool private;
  Owner? owner;
  String htmlUrl;
  String description;
  bool fork;
  String url;
  String forksUrl;
  String collaboratorsUrl;
  String teamsUrl;
  String issueEventsUrl;
  String eventsUrl;
  String assigneesUrl;
  String branchesUrl;
  String gitTagsUrl;
  String gitRefsUrl;
  String treesUrl;
  String statusesUrl;
  String languagesUrl;
  String stargazersUrl;
  String contributorsUrl;
  String subscribersUrl;
  String subscriptionUrl;
  String issueCommentUrl;
  String contentsUrl;
  String compareUrl;
  String mergesUrl;
  String archiveUrl;
  String downloadsUrl;
  String issuesUrl;
  String pullsUrl;
  String labelsUrl;
  String releasesUrl;
  String deploymentsUrl;
  String createdAt;
  String updatedAt;
  String pushedAt;
  String cloneUrl;
  String homepage;
  int size;
  int stargazersCount;
  int watchersCount;
  String language;
  int forksCount;
  int openIssuesCount;
  int forks;
  int openIssues;
  int watchers;
  String defaultBranch;
  Owner? organization;

  ReposModel({
      required this.id,
      required this.name,
      required this.fullName,
      required this.private,
      required this.owner,
      required this.htmlUrl,
      required this.description,
      required this.fork,
      required this.url,
      required this.forksUrl,
      required this.collaboratorsUrl,
      required this.teamsUrl,
      required this.issueEventsUrl,
      required this.eventsUrl,
      required this.assigneesUrl,
      required this.branchesUrl,
      required this.gitTagsUrl,
      required this.gitRefsUrl,
      required this.treesUrl,
      required this.statusesUrl,
      required this.languagesUrl,
      required this.stargazersUrl,
      required this.contributorsUrl,
      required this.subscribersUrl,
      required this.subscriptionUrl,
      required this.issueCommentUrl,
      required this.contentsUrl,
      required this.compareUrl,
      required this.mergesUrl,
      required this.archiveUrl,
      required this.downloadsUrl,
      required this.issuesUrl,
      required this.pullsUrl,
      required this.labelsUrl,
      required this.releasesUrl,
      required this.deploymentsUrl,
      required this.createdAt,
      required this.updatedAt,
      required this.pushedAt,
      required this.cloneUrl,
      required this.homepage,
      required this.size,
      required this.stargazersCount,
      required this.watchersCount,
      required this.language,
      required this.forksCount,
      required this.openIssuesCount,
      required this.forks,
      required this.openIssues,
      required this.watchers,
      required this.defaultBranch,
      required this.organization,
  });

  static ReposModel fromMap(Map<String, dynamic> map) {
      return ReposModel(
          id: map['id'],
          name: map['name'] ?? '',
          fullName: map['full_name'] ?? '',
          private: map['private'] ?? false,
          owner: map['owner'] != null ? Owner.fromMap(map['owner']) : null,
          htmlUrl: map['html_url'] ?? '',
          description: map['description'] ?? '',
          fork: map['fork'] ?? false,
          url: map['url'] ?? '',
          forksUrl: map['forks_url'] ?? '',
          collaboratorsUrl: map['collaborators_url'] ?? '',
          teamsUrl: map['teams_url'] ?? '',
          issueEventsUrl: map['issue_events_url'] ?? '',
          eventsUrl: map['events_url'] ?? '',
          assigneesUrl: map['assignees_url'] ?? '',
          branchesUrl: map['branches_url'] ?? '',
          gitTagsUrl: map['git_tags_url'] ?? '',
          gitRefsUrl: map['git_refs_url'] ?? '',
          treesUrl: map['trees_url'] ?? '',
          statusesUrl: map['statuses_url'] ?? '',
          languagesUrl: map['languages_url'] ?? '',
          stargazersUrl: map['stargazers_url'] ?? '',
          contributorsUrl: map['contributors_url'] ?? '',
          subscribersUrl: map['subscribers_url'] ?? '',
          subscriptionUrl: map['subscription_url'] ?? '',
          issueCommentUrl: map['issue_comment_url'] ?? '',
          contentsUrl: map['contents_url'] ?? '',
          compareUrl: map['compare_url'] ?? '',
          mergesUrl: map['merges_url'] ?? '',
          archiveUrl: map['archive_url'] ?? '',
          downloadsUrl: map['downloads_url'] ?? '',
          issuesUrl: map['issues_url'] ?? '',
          pullsUrl: map['pulls_url'] ?? '',
          labelsUrl: map['labels_url'] ?? '',
          releasesUrl: map['releases_url'] ?? '',
          deploymentsUrl: map['deployments_url'] ?? '',
          createdAt: map['created_at'] ?? '',
          updatedAt: map['updated_at'] ?? '',
          pushedAt: map['pushed_at'] ?? '',
          cloneUrl: map['clone_url'] ?? '',
          homepage: map['homepage'] ?? '',
          size: map['size'] ?? 0,
          stargazersCount: map['stargazers_count'] ?? 0,
          watchersCount: map['watchers_count'] ?? 0,
          language: map['language'] ?? '',
          forksCount: map['forks_count'] ?? 0,
          openIssuesCount: map['open_issues_count'] ?? 0,
          forks: map['forks'] ?? 0,
          openIssues: map['open_issues'] ?? 0,
          watchers: map['watchers'] ?? 0,
          defaultBranch: map['default_branch'] ?? '',
          organization: map['organization'] != null ? Owner.fromMap(map['organization']) : null
      );
  }

  Map<String, dynamic> toMap() {
      final Map<String, dynamic> data = Map<String, dynamic>();
      data['id'] = this.id;
      data['name'] = this.name;
      data['full_name'] = this.fullName;
      data['private'] = this.private;
      if(this.owner != null)
          data['owner'] = this.owner!.toJson();
      data['html_url'] = this.htmlUrl;
      data['description'] = this.description;
      data['fork'] = this.fork;
      data['url'] = this.url;
      data['forks_url'] = this.forksUrl;
      data['collaborators_url'] = this.collaboratorsUrl;
      data['teams_url'] = this.teamsUrl;
      data['issue_events_url'] = this.issueEventsUrl;
      data['events_url'] = this.eventsUrl;
      data['assignees_url'] = this.assigneesUrl;
      data['branches_url'] = this.branchesUrl;
      data['git_tags_url'] = this.gitTagsUrl;
      data['git_refs_url'] = this.gitRefsUrl;
      data['trees_url'] = this.treesUrl;
      data['statuses_url'] = this.statusesUrl;
      data['languages_url'] = this.languagesUrl;
      data['stargazers_url'] = this.stargazersUrl;
      data['contributors_url'] = this.contributorsUrl;
      data['subscribers_url'] = this.subscribersUrl;
      data['subscription_url'] = this.subscriptionUrl;
      data['issue_comment_url'] = this.issueCommentUrl;
      data['contents_url'] = this.contentsUrl;
      data['compare_url'] = this.compareUrl;
      data['merges_url'] = this.mergesUrl;
      data['archive_url'] = this.archiveUrl;
      data['downloads_url'] = this.downloadsUrl;
      data['issues_url'] = this.issuesUrl;
      data['pulls_url'] = this.pullsUrl;
      data['labels_url'] = this.labelsUrl;
      data['releases_url'] = this.releasesUrl;
      data['deployments_url'] = this.deploymentsUrl;
      data['created_at'] = this.createdAt;
      data['updated_at'] = this.updatedAt;
      data['pushed_at'] = this.pushedAt;
      data['clone_url'] = this.cloneUrl;
      data['homepage'] = this.homepage;
      data['size'] = this.size;
      data['stargazers_count'] = this.stargazersCount;
      data['watchers_count'] = this.watchersCount;
      data['language'] = this.language;
      data['forks_count'] = this.forksCount;
      data['open_issues_count'] = this.openIssuesCount;
      data['forks'] = this.forks;
      data['open_issues'] = this.openIssues;
      data['watchers'] = this.watchers;
      data['default_branch'] = this.defaultBranch;
      if (this.organization != null)
          data['organization'] = this.organization!.toJson();
      return data;
  }
}

class Owner {
  String login;
  int id;
  String avatarUrl;
  String gravatarId;
  String url;
  String htmlUrl;
  String followersUrl;
  String gistsUrl;
  String starredUrl;
  String subscriptionsUrl;
  String organizationsUrl;
  String reposUrl;
  String type;

  Owner({
      required this.login,
      required this.id,
      required this.avatarUrl,
      required this.gravatarId,
      required this.url,
      required this.htmlUrl,
      required this.followersUrl,
      required this.gistsUrl,
      required this.starredUrl,
      required this.subscriptionsUrl,
      required this.organizationsUrl,
      required this.reposUrl,
      required this.type,
  });

  static Owner fromMap(Map<String, dynamic> json) {
      return Owner(
          login: json['login'] ?? '',
          id: json['id'],
          avatarUrl: json['avatar_url'] ?? '',
          gravatarId: json['gravatar_id'] ?? '',
          url: json['url'] ?? '',
          htmlUrl: json['html_url'] ?? '',
          followersUrl: json['followers_url'] ?? '',
          gistsUrl: json['gists_url'] ?? '',
          starredUrl: json['starred_url'] ?? '',
          subscriptionsUrl: json['subscriptions_url'] ?? '',
          organizationsUrl: json['organizations_url'] ?? '',
          reposUrl: json['repos_url'] ?? '',
          type: json['type'] ?? ''
      );
  }

  Map<String, dynamic> toJson() {
      final Map<String, dynamic> data = Map<String, dynamic>();
      data['login'] = this.login;
      data['id'] = this.id;
      data['avatar_url'] = this.avatarUrl;
      data['gravatar_id'] = this.gravatarId;
      data['url'] = this.url;
      data['html_url'] = this.htmlUrl;
      data['followers_url'] = this.followersUrl;
      data['gists_url'] = this.gistsUrl;
      data['starred_url'] = this.starredUrl;
      data['subscriptions_url'] = this.subscriptionsUrl;
      data['organizations_url'] = this.organizationsUrl;
      data['repos_url'] = this.reposUrl;
      data['type'] = this.type;
      return data;
  }
}