// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Repos _$ReposFromJson(Map<String, dynamic> json) {
  return Repos(
    json['id'] as int,
    json['node_id'] as String,
    json['name'] as String,
    json['full_name'] as String,
    json['private'] as bool,
    json['owner'] == null
        ? null
        : Owner.fromJson(json['owner'] as Map<String, dynamic>),
    json['html_url'] as String,
    json['description'] as String,
    json['fork'] as bool,
    json['url'] as String,
    json['forks_url'] as String,
    json['keys_url'] as String,
    json['collaborators_url'] as String,
    json['teams_url'] as String,
    json['hooks_url'] as String,
    json['issue_events_url'] as String,
    json['events_url'] as String,
    json['assignees_url'] as String,
    json['branches_url'] as String,
    json['tags_url'] as String,
    json['blobs_url'] as String,
    json['git_tags_url'] as String,
    json['git_refs_url'] as String,
    json['trees_url'] as String,
    json['statuses_url'] as String,
    json['languages_url'] as String,
    json['stargazers_url'] as String,
    json['contributors_url'] as String,
    json['subscribers_url'] as String,
    json['subscription_url'] as String,
    json['commits_url'] as String,
    json['git_commits_url'] as String,
    json['comments_url'] as String,
    json['issue_comment_url'] as String,
    json['contents_url'] as String,
    json['compare_url'] as String,
    json['merges_url'] as String,
    json['archive_url'] as String,
    json['downloads_url'] as String,
    json['issues_url'] as String,
    json['pulls_url'] as String,
    json['milestones_url'] as String,
    json['notifications_url'] as String,
    json['labels_url'] as String,
    json['releases_url'] as String,
    json['deployments_url'] as String,
    json['created_at'] as String,
    json['updated_at'] as String,
    json['pushed_at'] as String,
    json['git_url'] as String,
    json['ssh_url'] as String,
    json['clone_url'] as String,
    json['svn_url'] as String,
    json['size'] as int,
    json['stargazers_count'] as int,
    json['watchers_count'] as int,
    json['language'] as String,
    json['has_issues'] as bool,
    json['has_projects'] as bool,
    json['has_downloads'] as bool,
    json['has_wiki'] as bool,
    json['has_pages'] as bool,
    json['forks_count'] as int,
    json['archived'] as bool,
    json['disabled'] as bool,
    json['open_issues_count'] as int,
    json['forks'] as int,
    json['open_issues'] as int,
    json['watchers'] as int,
    json['default_branch'] as String,
  );
}

Map<String, dynamic> _$ReposToJson(Repos instance) => <String, dynamic>{
      'id': instance.id,
      'node_id': instance.nodeId,
      'name': instance.name,
      'full_name': instance.fullName,
      'private': instance.private,
      'owner': instance.owner,
      'html_url': instance.htmlUrl,
      'description': instance.description,
      'fork': instance.fork,
      'url': instance.url,
      'forks_url': instance.forksUrl,
      'keys_url': instance.keysUrl,
      'collaborators_url': instance.collaboratorsUrl,
      'teams_url': instance.teamsUrl,
      'hooks_url': instance.hooksUrl,
      'issue_events_url': instance.issueEventsUrl,
      'events_url': instance.eventsUrl,
      'assignees_url': instance.assigneesUrl,
      'branches_url': instance.branchesUrl,
      'tags_url': instance.tagsUrl,
      'blobs_url': instance.blobsUrl,
      'git_tags_url': instance.gitTagsUrl,
      'git_refs_url': instance.gitRefsUrl,
      'trees_url': instance.treesUrl,
      'statuses_url': instance.statusesUrl,
      'languages_url': instance.languagesUrl,
      'stargazers_url': instance.stargazersUrl,
      'contributors_url': instance.contributorsUrl,
      'subscribers_url': instance.subscribersUrl,
      'subscription_url': instance.subscriptionUrl,
      'commits_url': instance.commitsUrl,
      'git_commits_url': instance.gitCommitsUrl,
      'comments_url': instance.commentsUrl,
      'issue_comment_url': instance.issueCommentUrl,
      'contents_url': instance.contentsUrl,
      'compare_url': instance.compareUrl,
      'merges_url': instance.mergesUrl,
      'archive_url': instance.archiveUrl,
      'downloads_url': instance.downloadsUrl,
      'issues_url': instance.issuesUrl,
      'pulls_url': instance.pullsUrl,
      'milestones_url': instance.milestonesUrl,
      'notifications_url': instance.notificationsUrl,
      'labels_url': instance.labelsUrl,
      'releases_url': instance.releasesUrl,
      'deployments_url': instance.deploymentsUrl,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'pushed_at': instance.pushedAt,
      'git_url': instance.gitUrl,
      'ssh_url': instance.sshUrl,
      'clone_url': instance.cloneUrl,
      'svn_url': instance.svnUrl,
      'size': instance.size,
      'stargazers_count': instance.stargazersCount,
      'watchers_count': instance.watchersCount,
      'language': instance.language,
      'has_issues': instance.hasIssues,
      'has_projects': instance.hasProjects,
      'has_downloads': instance.hasDownloads,
      'has_wiki': instance.hasWiki,
      'has_pages': instance.hasPages,
      'forks_count': instance.forksCount,
      'archived': instance.archived,
      'disabled': instance.disabled,
      'open_issues_count': instance.openIssuesCount,
      'forks': instance.forks,
      'open_issues': instance.openIssues,
      'watchers': instance.watchers,
      'default_branch': instance.defaultBranch,
    };

Owner _$OwnerFromJson(Map<String, dynamic> json) {
  return Owner(
    json['login'] as String,
    json['id'] as int,
    json['node_id'] as String,
    json['avatar_url'] as String,
    json['gravatar_id'] as String,
    json['url'] as String,
    json['html_url'] as String,
    json['followers_url'] as String,
    json['following_url'] as String,
    json['gists_url'] as String,
    json['starred_url'] as String,
    json['subscriptions_url'] as String,
    json['organizations_url'] as String,
    json['repos_url'] as String,
    json['events_url'] as String,
    json['received_events_url'] as String,
    json['type'] as String,
    json['site_admin'] as bool,
  );
}

Map<String, dynamic> _$OwnerToJson(Owner instance) => <String, dynamic>{
      'login': instance.login,
      'id': instance.id,
      'node_id': instance.nodeId,
      'avatar_url': instance.avatarUrl,
      'gravatar_id': instance.gravatarId,
      'url': instance.url,
      'html_url': instance.htmlUrl,
      'followers_url': instance.followersUrl,
      'following_url': instance.followingUrl,
      'gists_url': instance.gistsUrl,
      'starred_url': instance.starredUrl,
      'subscriptions_url': instance.subscriptionsUrl,
      'organizations_url': instance.organizationsUrl,
      'repos_url': instance.reposUrl,
      'events_url': instance.eventsUrl,
      'received_events_url': instance.receivedEventsUrl,
      'type': instance.type,
      'site_admin': instance.siteAdmin,
    };
