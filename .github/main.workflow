workflow "Publish to Rubygems" {
  on = "push"
  resolves = ["Publish"]
}

action "Tag Filter" {
  uses = "actions/bin/filter@master"
  args = "tag v*"
}

action "Install Dependencies" {
  uses = "docker://ruby:2.6.0"
  runs = "bundle install"
  needs = ["Tag Filter"]
}

action "Publish" {
  uses = "cadwallion/publish-rubygems-action@master"
  needs = ["Install Dependencies"]
  secrets = ["GITHUB_TOKEN", "RUBYGEMS_API_KEY"]
}
