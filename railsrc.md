
#### setting up a new rails project

first of all, don't use a `.railsrc` (has caused me pain in the past)

```shell
ruby --version
gem install rails
rails new appname \
--database=postgresql \
--skip-javascript \
--skip-coffee \
--skip-action-cable \
--skip-bundle \
--skip-listen \
--skip-puma \
--skip-spring \
--skip-test \
--skip-turbolinks
```

Maybe you want rspec

```shell
cd appname
rm -r test
echo -n "gem 'rspec-rails'" >> Gemfile
bundle install
bundle exec rails generate rspec:install
```
