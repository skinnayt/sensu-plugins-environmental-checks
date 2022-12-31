# Change Log
This project adheres to [Semantic Versioning](http://semver.org/).

This CHANGELOG follows the format listed [here](https://github.com/sensu-plugins/community/blob/master/HOW_WE_CHANGELOG.md)

## [Unreleased]
### Breaking Changes
- Dropped support for Ruby < 2.3 as it is EOLed (@jaredledvina)
- Bump `sensu-plugin` dependency from `~> 2.0` to `~> 4.0` you can read the changelog entries for [4.0](https://github.com/sensu-plugins/sensu-plugin/blob/master/CHANGELOG.md#400---2018-02-17) and [3.0](https://github.com/sensu-plugins/sensu-plugin/blob/master/CHANGELOG.md#300---2018-12-04) (@jaredledvina)

### Changed
- Update Rubocop to 0.50 and appease the cops (@jaredledvina)

## [1.3.1] - 2022-12-31
### Changed
- `check-temperature.rb`: parse negative values

## [1.3.0] - 2019-05-23
### Added
- `metrics-temperature.rb`: support for Intel Gen 6+ CPUs(@mdzidic)

## [1.2.0] - 2018-02-13
### Removed
- `check-temperature.rb`: removed unnecessary `print`

### Changed
- updated changelog guidelines location (@majormoses)

### Fixed
- fixed spelling in PR template (@majormoses)

## [1.1.0] - 2017-05-17
- add temperature check (@holygits)

## [1.0.0] - 2017-03-15
### Added
- made metrics aware of multiple chips (@GhostLyrics)
- made metrics also collect power draw (@GhostLyrics)
- support for Ruby 2.3.0 (@eheydrick)

### Removed
- support for Ruby < 2 (@eheydrick)

### Changed
- Rubocop upgrade and cleanup (@mattyjones/@eheydrick)
- Loosen `sensu-plugin` dependency to `~> 1.2` (@mattyjones)

## [0.0.3] - 2015-07-14
### Changed
- update sensu-plugin gem to 1.2.0

## [0.0.2] - 2015-06-02
### Fixed
- added binstubs

### Changed
- removed cruft from /lib

## 0.0.1 - 2015-05-21
### Added
- initial release

[Unreleased]: https://github.com/sensu-plugins/sensu-plugins-environmental-checks/compare/1.3.0...HEAD
[1.3.0]: https://github.com/sensu-plugins/sensu-plugins-environmental-checks/compare/1.2.0...1.3.0
[1.2.0]: https://github.com/sensu-plugins/sensu-plugins-environmental-checks/compare/1.1.0...1.2.0
[1.1.0]: https://github.com/sensu-plugins/sensu-plugins-environmental-checks/compare/1.0.0...1.1.0
[1.0.0]: https://github.com/sensu-plugins/sensu-plugins-environmental-checks/compare/0.0.3...1.0.0
[0.0.3]: https://github.com/sensu-plugins/sensu-plugins-environmental-checks/compare/0.0.2...0.0.3
[0.0.2]: https://github.com/sensu-plugins/sensu-plugins-environmental-checks/compare/0.0.1...0.0.2
