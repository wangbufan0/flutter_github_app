import 'package:flutter_github_app/generated/json/base/json_convert_content.dart';
import 'package:flutter_github_app/generated/json/base/json_filed.dart';

class UserEntity with JsonConvert<UserEntity> {
	String login;
	int id;
	@JSONField(name: "node_id")
	String nodeId;
	@JSONField(name: "avatar_url")
	String avatarUrl;
	@JSONField(name: "gravatar_id")
	String gravatarId;
	String url;
	@JSONField(name: "html_url")
	String htmlUrl;
	@JSONField(name: "followers_url")
	String followersUrl;
	@JSONField(name: "following_url")
	String followingUrl;
	@JSONField(name: "gists_url")
	String gistsUrl;
	@JSONField(name: "starred_url")
	String starredUrl;
	@JSONField(name: "subscriptions_url")
	String subscriptionsUrl;
	@JSONField(name: "organizations_url")
	String organizationsUrl;
	@JSONField(name: "repos_url")
	String reposUrl;
	@JSONField(name: "events_url")
	String eventsUrl;
	@JSONField(name: "received_events_url")
	String receivedEventsUrl;
	String type;
	@JSONField(name: "site_admin")
	bool siteAdmin;
	String name;
	String company;
	String blog;
	String location;
	String email;
	String hireable;
	String bio;
	@JSONField(name: "public_repos")
	int publicRepos;
	@JSONField(name: "public_gists")
	int publicGists;
	int followers;
	int following;
	@JSONField(name: "created_at")
	String createdAt;
	@JSONField(name: "updated_at")
	String updatedAt;
}
