workflow "Publish to Rubygems" {
  on = "push"
  resolves = ["Publish"]
}

action "Tag Filter" {
  uses = "actions/bin/filter@master"
  args = "tag v*"
}

action "Publish" {
  uses = "cadwallion/publish-rubygems-action@master"
  needs = ["Tag Filter"]
  secrets = ["GITHUB_TOKEN", "RUBYGEMS_API_KEY"]
}
