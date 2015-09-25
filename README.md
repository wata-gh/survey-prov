# survey-prov

```sh
vagrant up
vagrant ssh-config --host survey_server >> ~/.ssh/config
bundle install --path vendor/bundle
bundle exec itamae ssh --vagrant --node-json nodes/web.json roles/web.rb
```
