## Sensu-Plugins-environmental-checks

[![Build Status](https://travis-ci.org/sensu-plugins/sensu-plugins-environmental-checks.svg?branch=master)](https://travis-ci.org/sensu-plugins/sensu-plugins-environmental-checks)
[![Gem Version](https://badge.fury.io/rb/sensu-plugins-environmental-checks.svg)](http://badge.fury.io/rb/sensu-plugins-environmental-checks)
[![Code Climate](https://codeclimate.com/github/sensu-plugins/sensu-plugins-environmental-checks/badges/gpa.svg)](https://codeclimate.com/github/sensu-plugins/sensu-plugins-environmental-checks)
[![Test Coverage](https://codeclimate.com/github/sensu-plugins/sensu-plugins-environmental-checks/badges/coverage.svg)](https://codeclimate.com/github/sensu-plugins/sensu-plugins-environmental-checks)
[![Dependency Status](https://gemnasium.com/sensu-plugins/sensu-plugins-environmental-checks.svg)](https://gemnasium.com/sensu-plugins/sensu-plugins-environmental-checks)

## Functionality

## Files
 * bin/metrics-temperature

## Usage

## Installation

Add the public key (if you haven’t already) as a trusted certificate

```
gem cert --add <(curl -Ls https://raw.githubusercontent.com/sensu-plugins/sensu-plugins.github.io/master/certs/sensu-plugins.pem)
gem install sensu-plugins-environmental-checks -P MediumSecurity
```

You can also download the key from /certs/ within each repository.

#### Rubygems

`gem install sensu-plugins-environmental-checks`

#### Bundler

Add *sensu-plugins-environmental-checks* to your Gemfile and run `bundle install` or `bundle update`

#### Chef

Using the Sensu **sensu_gem** LWRP
```
sensu_gem 'sensu-plugins-environmental-checks' do
  options('--prerelease')
  version '0.0.1'
end
```

Using the Chef **gem_package** resource
```
gem_package 'sensu-plugins-environmental-checks' do
  options('--prerelease')
  version '0.0.1'
end
```

## Notes
