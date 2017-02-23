
#### setting up a new rails project

First of all, don't use a `.railsrc`

```shell
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
rm -r test
bundle install rspec-rails
bundle exec rails generate rspec:install
```
