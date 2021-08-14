class ReposModel {
  int id;
  String nodeId;
  String name;
  String fullName;
  bool private;
  Owner? owner;
  String htmlUrl;
  String description;
  bool fork;
  String url;
  String forksUrl;
  String keysUrl;
  String collaboratorsUrl;
  String teamsUrl;
  String hooksUrl;
  String issueEventsUrl;
  String eventsUrl;
  String assigneesUrl;
  String branchesUrl;
  String tagsUrl;
  String blobsUrl;
  String gitTagsUrl;
  String gitRefsUrl;
  String treesUrl;
  String statusesUrl;
  String languagesUrl;
  String stargazersUrl;
  String contributorsUrl;
  String subscribersUrl;
  String subscriptionUrl;
  String commitsUrl;
  String gitCommitsUrl;
  String commentsUrl;
  String issueCommentUrl;
  String contentsUrl;
  String compareUrl;
  String mergesUrl;
  String archiveUrl;
  String downloadsUrl;
  String issuesUrl;
  String pullsUrl;
  String milestonesUrl;
  String notificationsUrl;
  String labelsUrl;
  String releasesUrl;
  String deploymentsUrl;
  String createdAt;
  String updatedAt;
  String pushedAt;
  String gitUrl;
  String sshUrl;
  String cloneUrl;
  String svnUrl;
  String homepage;
  int size;
  int stargazersCount;
  int watchersCount;
  String language;
  bool hasIssues;
  bool hasProjects;
  bool hasDownloads;
  bool hasWiki;
  bool hasPages;
  int forksCount;
  bool archived;
  bool disabled;
  int openIssuesCount;
  int forks;
  int openIssues;
  int watchers;
  String defaultBranch;
  Owner? organization;
  int networkCount;
  int subscribersCount;

  ReposModel({
      required this.id,
      required this.nodeId,
      required this.name,
      required this.fullName,
      required this.private,
      required this.owner,
      required this.htmlUrl,
      required this.description,
      required this.fork,
      required this.url,
      required this.forksUrl,
      required this.keysUrl,
      required this.collaboratorsUrl,
      required this.teamsUrl,
      required this.hooksUrl,
      required this.issueEventsUrl,
      required this.eventsUrl,
      required this.assigneesUrl,
      required this.branchesUrl,
      required this.tagsUrl,
      required this.blobsUrl,
      required this.gitTagsUrl,
      required this.gitRefsUrl,
      required this.treesUrl,
      required this.statusesUrl,
      required this.languagesUrl,
      required this.stargazersUrl,
      required this.contributorsUrl,
      required this.subscribersUrl,
      required this.subscriptionUrl,
      required this.commitsUrl,
      required this.gitCommitsUrl,
      required this.commentsUrl,
      required this.issueCommentUrl,
      required this.contentsUrl,
      required this.compareUrl,
      required this.mergesUrl,
      required this.archiveUrl,
      required this.downloadsUrl,
      required this.issuesUrl,
      required this.pullsUrl,
      required this.milestonesUrl,
      required this.notificationsUrl,
      required this.labelsUrl,
      required this.releasesUrl,
      required this.deploymentsUrl,
      required this.createdAt,
      required this.updatedAt,
      required this.pushedAt,
      required this.gitUrl,
      required this.sshUrl,
      required this.cloneUrl,
      required this.svnUrl,
      required this.homepage,
      required this.size,
      required this.stargazersCount,
      required this.watchersCount,
      required this.language,
      required this.hasIssues,
      required this.hasProjects,
      required this.hasDownloads,
      required this.hasWiki,
      required this.hasPages,
      required this.forksCount,
      required this.archived,
      required this.disabled,
      required this.openIssuesCount,
      required this.forks,
      required this.openIssues,
      required this.watchers,
      required this.defaultBranch,
      required this.organization,
      required this.networkCount,
      required this.subscribersCount
  });

  static ReposModel fromMap(Map<String, dynamic> map) {
      return ReposModel(
          id: map['id'],
          nodeId: map['node_id'] ?? '',
          name: map['name'] ?? '',
          fullName: map['full_name'] ?? '',
          private: map['private'] ?? false,
          owner: map['owner'] != null ? Owner.fromMap(map['owner']) : null,
          htmlUrl: map['html_url'] ?? '',
          description: map['description'] ?? '',
          fork: map['fork'] ?? false,
          url: map['url'] ?? '',
          forksUrl: map['forks_url'] ?? '',
          keysUrl: map['keys_url'] ?? '',
          collaboratorsUrl: map['collaborators_url'] ?? '',
          teamsUrl: map['teams_url'] ?? '',
          hooksUrl: map['hooks_url'] ?? '',
          issueEventsUrl: map['issue_events_url'] ?? '',
          eventsUrl: map['events_url'] ?? '',
          assigneesUrl: map['assignees_url'] ?? '',
          branchesUrl: map['branches_url'] ?? '',
          tagsUrl: map['tags_url'] ?? '',
          blobsUrl: map['blobs_url'] ?? '',
          gitTagsUrl: map['git_tags_url'] ?? '',
          gitRefsUrl: map['git_refs_url'] ?? '',
          treesUrl: map['trees_url'] ?? '',
          statusesUrl: map['statuses_url'] ?? '',
          languagesUrl: map['languages_url'] ?? '',
          stargazersUrl: map['stargazers_url'] ?? '',
          contributorsUrl: map['contributors_url'] ?? '',
          subscribersUrl: map['subscribers_url'] ?? '',
          subscriptionUrl: map['subscription_url'] ?? '',
          commitsUrl: map['commits_url'] ?? '',
          gitCommitsUrl: map['git_commits_url'] ?? '',
          commentsUrl: map['comments_url'] ?? '',
          issueCommentUrl: map['issue_comment_url'] ?? '',
          contentsUrl: map['contents_url'] ?? '',
          compareUrl: map['compare_url'] ?? '',
          mergesUrl: map['merges_url'] ?? '',
          archiveUrl: map['archive_url'] ?? '',
          downloadsUrl: map['downloads_url'] ?? '',
          issuesUrl: map['issues_url'] ?? '',
          pullsUrl: map['pulls_url'] ?? '',
          milestonesUrl: map['milestones_url'] ?? '',
          notificationsUrl: map['notifications_url'] ?? '',
          labelsUrl: map['labels_url'] ?? '',
          releasesUrl: map['releases_url'] ?? '',
          deploymentsUrl: map['deployments_url'] ?? '',
          createdAt: map['created_at'] ?? '',
          updatedAt: map['updated_at'] ?? '',
          pushedAt: map['pushed_at'] ?? '',
          gitUrl: map['git_url'] ?? '',
          sshUrl: map['ssh_url'] ?? '',
          cloneUrl: map['clone_url'] ?? '',
          svnUrl: map['svn_url'] ?? '',
          homepage: map['homepage'] ?? '',
          size: map['size'] ?? 0,
          stargazersCount: map['stargazers_count'] ?? 0,
          watchersCount: map['watchers_count'] ?? 0,
          language: map['language'] ?? '',
          hasIssues: map['has_issues'] ?? false,
          hasProjects: map['has_projects'] ?? false,
          hasDownloads: map['has_downloads'] ?? false,
          hasWiki: map['has_wiki'] ?? false,
          hasPages: map['has_pages'] ?? false,
          forksCount: map['forks_count'] ?? 0,
          archived: map['archived'] ?? false,
          disabled: map['disabled'] ?? false,
          openIssuesCount: map['open_issues_count'] ?? 0,
          forks: map['forks'] ?? 0,
          openIssues: map['open_issues'] ?? 0,
          watchers: map['watchers'] ?? 0,
          defaultBranch: map['default_branch'] ?? '',
          organization: map['organization'] != null ? Owner.fromMap(map['organization']) : null,
          networkCount: map['network_count'] ?? 0,
          subscribersCount: map['subscribers_count'] ?? 0
      );
  }

  Map<String, dynamic> toMap() {
      final Map<String, dynamic> data = Map<String, dynamic>();
      data['id'] = this.id;
      data['node_id'] = this.nodeId;
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
      data['keys_url'] = this.keysUrl;
      data['collaborators_url'] = this.collaboratorsUrl;
      data['teams_url'] = this.teamsUrl;
      data['hooks_url'] = this.hooksUrl;
      data['issue_events_url'] = this.issueEventsUrl;
      data['events_url'] = this.eventsUrl;
      data['assignees_url'] = this.assigneesUrl;
      data['branches_url'] = this.branchesUrl;
      data['tags_url'] = this.tagsUrl;
      data['blobs_url'] = this.blobsUrl;
      data['git_tags_url'] = this.gitTagsUrl;
      data['git_refs_url'] = this.gitRefsUrl;
      data['trees_url'] = this.treesUrl;
      data['statuses_url'] = this.statusesUrl;
      data['languages_url'] = this.languagesUrl;
      data['stargazers_url'] = this.stargazersUrl;
      data['contributors_url'] = this.contributorsUrl;
      data['subscribers_url'] = this.subscribersUrl;
      data['subscription_url'] = this.subscriptionUrl;
      data['commits_url'] = this.commitsUrl;
      data['git_commits_url'] = this.gitCommitsUrl;
      data['comments_url'] = this.commentsUrl;
      data['issue_comment_url'] = this.issueCommentUrl;
      data['contents_url'] = this.contentsUrl;
      data['compare_url'] = this.compareUrl;
      data['merges_url'] = this.mergesUrl;
      data['archive_url'] = this.archiveUrl;
      data['downloads_url'] = this.downloadsUrl;
      data['issues_url'] = this.issuesUrl;
      data['pulls_url'] = this.pullsUrl;
      data['milestones_url'] = this.milestonesUrl;
      data['notifications_url'] = this.notificationsUrl;
      data['labels_url'] = this.labelsUrl;
      data['releases_url'] = this.releasesUrl;
      data['deployments_url'] = this.deploymentsUrl;
      data['created_at'] = this.createdAt;
      data['updated_at'] = this.updatedAt;
      data['pushed_at'] = this.pushedAt;
      data['git_url'] = this.gitUrl;
      data['ssh_url'] = this.sshUrl;
      data['clone_url'] = this.cloneUrl;
      data['svn_url'] = this.svnUrl;
      data['homepage'] = this.homepage;
      data['size'] = this.size;
      data['stargazers_count'] = this.stargazersCount;
      data['watchers_count'] = this.watchersCount;
      data['language'] = this.language;
      data['has_issues'] = this.hasIssues;
      data['has_projects'] = this.hasProjects;
      data['has_downloads'] = this.hasDownloads;
      data['has_wiki'] = this.hasWiki;
      data['has_pages'] = this.hasPages;
      data['forks_count'] = this.forksCount;
      data['archived'] = this.archived;
      data['disabled'] = this.disabled;
      data['open_issues_count'] = this.openIssuesCount;
      data['forks'] = this.forks;
      data['open_issues'] = this.openIssues;
      data['watchers'] = this.watchers;
      data['default_branch'] = this.defaultBranch;
      if (this.organization != null)
          data['organization'] = this.organization!.toJson();
      data['network_count'] = this.networkCount;
      data['subscribers_count'] = this.subscribersCount;
      return data;
  }
}

class Owner {
  String login;
  int id;
  String nodeId;
  String avatarUrl;
  String gravatarId;
  String url;
  String htmlUrl;
  String followersUrl;
  String followingUrl;
  String gistsUrl;
  String starredUrl;
  String subscriptionsUrl;
  String organizationsUrl;
  String reposUrl;
  String eventsUrl;
  String receivedEventsUrl;
  String type;
  bool siteAdmin;

  Owner({
      required this.login,
      required this.id,
      required this.nodeId,
      required this.avatarUrl,
      required this.gravatarId,
      required this.url,
      required this.htmlUrl,
      required this.followersUrl,
      required this.followingUrl,
      required this.gistsUrl,
      required this.starredUrl,
      required this.subscriptionsUrl,
      required this.organizationsUrl,
      required this.reposUrl,
      required this.eventsUrl,
      required this.receivedEventsUrl,
      required this.type,
      required this.siteAdmin
  });

  static Owner fromMap(Map<String, dynamic> json) {
      return Owner(
          login: json['login'] ?? '',
          id: json['id'],
          nodeId: json['node_id'] ?? '',
          avatarUrl: json['avatar_url'] ?? '',
          gravatarId: json['gravatar_id'] ?? '',
          url: json['url'] ?? '',
          htmlUrl: json['html_url'] ?? '',
          followersUrl: json['followers_url'] ?? '',
          followingUrl: json['following_url'] ?? '',
          gistsUrl: json['gists_url'] ?? '',
          starredUrl: json['starred_url'] ?? '',
          subscriptionsUrl: json['subscriptions_url'] ?? '',
          organizationsUrl: json['organizations_url'] ?? '',
          reposUrl: json['repos_url'] ?? '',
          eventsUrl: json['events_url'] ?? '',
          receivedEventsUrl: json['received_events_url'] ?? '',
          type: json['type'] ?? '',
          siteAdmin: json['site_admin'] ?? false
      );
  }

  Map<String, dynamic> toJson() {
      final Map<String, dynamic> data = Map<String, dynamic>();
      data['login'] = this.login;
      data['id'] = this.id;
      data['node_id'] = this.nodeId;
      data['avatar_url'] = this.avatarUrl;
      data['gravatar_id'] = this.gravatarId;
      data['url'] = this.url;
      data['html_url'] = this.htmlUrl;
      data['followers_url'] = this.followersUrl;
      data['following_url'] = this.followingUrl;
      data['gists_url'] = this.gistsUrl;
      data['starred_url'] = this.starredUrl;
      data['subscriptions_url'] = this.subscriptionsUrl;
      data['organizations_url'] = this.organizationsUrl;
      data['repos_url'] = this.reposUrl;
      data['events_url'] = this.eventsUrl;
      data['received_events_url'] = this.receivedEventsUrl;
      data['type'] = this.type;
      data['site_admin'] = this.siteAdmin;
      return data;
  }
}