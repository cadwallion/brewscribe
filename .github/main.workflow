workflow "Publish to Rubygems" {
  on = "release"
  resolves = ["Publish"]
}

action "Install Dependencies" {
  uses = "docker://ruby:2.6.0"
  runs = "bundle install"
}

action "Publish" {
  uses = "cadwallion/publish-rubygems-action@master"
  needs = ["Install Dependencies"]
  secrets = ["GITHUB_TOKEN", "RUBYGEMS_API_KEY"]
}
