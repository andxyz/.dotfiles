
#### setting up a new rails project

First of all, don't use a `.railsrc`

```shell
ruby --version
gem install rails
rails new appname \
--database=postgresql \
--skip-action-cable \
--skip-bundle \
--skip-listen \
--skip-puma \
--skip-spring \
--skip-test \
--skip-turbolinks
```

```shell
cd appname
rm -r test
echo -n "gem 'rspec-rails'" >> Gemfile
bundle install
bundle exec rails generate rspec:install
```
