ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'capybara/dsl'
require 'capybara/rspec'
require 'rack_session_access/capybara'

#mock requests to GitHub API with VCR and Webmock 
require 'webmock/rspec'  
WebMock.disable_net_connect!(allow_localhost: true)

#mock omniauth response from GitHub
OmniAuth.config.test_mode = true
  omniauth_hash = {"provider"=>"github",
 "uid"=>"8999596",
 "info"=>
  {"nickname"=>"SophieDeBenedetto",
   "email"=>"sophie.debenedetto@gmail.com",
   "name"=>"Sophie DeBenedetto",
   "image"=>"https://avatars.githubusercontent.com/u/8999596?v=3",
   "urls"=>{"GitHub"=>"https://github.com/SophieDeBenedetto", "Blog"=>"http://www.sophiedebenedetto.nyc"}},
 "credentials"=>{"token"=>"e1cf5fake21f13X0135609d1a9a5ea447986b5ab", "expires"=>false}
  }

OmniAuth.config.add_mock(:github, omniauth_hash)

#other, regular, stuff
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_base_class_for_anonymous_controllers = false
  config.order = "default"
  config.include Capybara::DSL
end



### HELPER METHODS###

def repos
  ["001.students.flatironschool.com",
 "handraise-redux",
 "flatiron-school.github.io",
 "002.students.flatironschool.com",
 "003.students.flatironschool.com",
 "dotfiles",
 "hipchat-hubot",
 "iOS-SkillShare-Slides",
 "flatiron-site-api",
 "booklet-generator",
 "prework.flatironschool.com",
 "fe.flatironschool.com",
 "progress-tracker",
 "secure.flatironschool.com",
 "hubot-thatherton-iv",
 "playthemoff.flatironschool.com",
 "ruby-debugging-checklist",
 "fe-student-directory.flatironschool.com",
 "IronCasts",
 "ironUploads",
 "techway",
 "flatiron-rails",
 "spinup",
 "how-to-write-a-lab",
 "procedural-js-template",
 "solari-dashboard",
 "solari-dashboard-ios",
 "origami-panacea",
 "rsvp.flatironschool.com",
 "postwork.flatironschool.com"]
end

def issues
  [{"url"=>"https://api.github.com/repos/flatiron-school/progress-tracker/issues/2",
  "labels_url"=>"https://api.github.com/repos/flatiron-school/progress-tracker/issues/2/labels{/name}",
  "comments_url"=>"https://api.github.com/repos/flatiron-school/progress-tracker/issues/2/comments",
  "events_url"=>"https://api.github.com/repos/flatiron-school/progress-tracker/issues/2/events",
  "html_url"=>"https://github.com/flatiron-school/progress-tracker/issues/2",
  "id"=>26061275,
  "number"=>2,
  "title"=>"Percentage complete calculation needs to be unified. ",
  "user"=>
   {"login"=>"arelenglish",
    "id"=>1619902,
    "avatar_url"=>"https://avatars.githubusercontent.com/u/1619902?v=3",
    "gravatar_id"=>"",
    "url"=>"https://api.github.com/users/arelenglish",
    "html_url"=>"https://github.com/arelenglish",
    "followers_url"=>"https://api.github.com/users/arelenglish/followers",
    "following_url"=>"https://api.github.com/users/arelenglish/following{/other_user}",
    "gists_url"=>"https://api.github.com/users/arelenglish/gists{/gist_id}",
    "starred_url"=>"https://api.github.com/users/arelenglish/starred{/owner}{/repo}",
    "subscriptions_url"=>"https://api.github.com/users/arelenglish/subscriptions",
    "organizations_url"=>"https://api.github.com/users/arelenglish/orgs",
    "repos_url"=>"https://api.github.com/users/arelenglish/repos",
    "events_url"=>"https://api.github.com/users/arelenglish/events{/privacy}",
    "received_events_url"=>"https://api.github.com/users/arelenglish/received_events",
    "type"=>"User",
    "site_admin"=>false},
  "labels"=>
   [{"url"=>"https://api.github.com/repos/flatiron-school/progress-tracker/labels/bug", "name"=>"bug", "color"=>"fc2929"}],
  "state"=>"open",
  "locked"=>false,
  "assignee"=>nil,
  "milestone"=>nil,
  "comments"=>0,
  "created_at"=>"2014-01-22T01:56:38Z",
  "updated_at"=>"2014-01-22T01:56:38Z",
  "closed_at"=>nil,
  "body"=>
   "This isn't a big deal, but right now percentage complete is calculated both by `(number of required badges earned) / (number of required badges`) and by `((percentage of site1 required badges earned + percentage of site2 required badges earned + percentage of site3 required badges earned)/ number of sites)`\r\n\r\nThe numbers are different, but not enough to make a difference for our purposes right now, but eventually we should switch to using completed badges / total badges * 100 to calculate % completed for both each website and for total completion percentage.  "}]
  
end


