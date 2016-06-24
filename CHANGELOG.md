# Change Log
All notable changes to this project will be documented in this file.

## [Unreleased]
### Added

- Resource `users/` provides new attributes like `first_name`, `last_name`, `email`, `birthday`, `created_at` and more.

## [0.4] - 2016-03-27
### Added

- Authentication with User-Token and Authorization with Bearer token
- New resource `users/{user_id}`
- Tests for Errors with wrong headers
- Show warning if request header Accept: application/vnd.api+json; net.youthweb.api.version=x.y is set with deprecated version

### Changed

- Show 415 error if request header Content-Type: application/vnd.api+json isn't set
- Show 406 error if request header Accept: application/vnd.api+json; net.youthweb.api.version=x.y isn't set
- Show 406 error if request header Accept: application/vnd.api+json; net.youthweb.api.version=x.y is set with unsupported version

## [0.3] - 2015-10-11
### Added

- Response header Content-Type: application/vnd.api+json added
- Response header Accept: application/vnd.api+json; net.youthweb.api.version=x.y added

### Changed

- Show warning if request header Content-Type: application/vnd.api+json isn't set
- Show warning if request header Accept: application/vnd.api+json; net.youthweb.api.version=x.y isn't set

### Removed
- The `account/stats` resource was removed.

## [0.2.1] - 2015-06-22
### Changed
- Mockserver apiary.io changed to local Drakov installation, so an apiary.io account isn't necessary.
- All resources are accessable through short urls.

### Deprecated
- Long urls to resources are deprecated, but won't be broken in near future. The use of short urls is recommended.

## [0.2] - 2015-06-21
### Added
- New resources `stats/account`, `stats/forum` and `stats/groups`.
- Better response description and new clients section in README.md.

### Changed
- response bodies are now following the [JSON API](http://jsonapi.org/) spec.

### Deprecated
- The `account/stats` resource will be deleted in the next release.

## [0.1] - 2014-12-17
### Added
- Behat-Tests for resource `account/stats`
- LICENCE file (GPLv2)
- this CHANGELOG.md
- Travis CI integration

## 0.0.1 - 2014-10-12
### Added
- Resource `account/stats`

[Unreleased]: https://github.com/youthweb/youthweb-api/compare/0.4...develop
[0.4]: https://github.com/youthweb/youthweb-api/compare/0.3...0.4
[0.3]: https://github.com/youthweb/youthweb-api/compare/0.2.1...0.3
[0.2.1]: https://github.com/youthweb/youthweb-api/compare/0.2...0.2.1
[0.2]: https://github.com/youthweb/youthweb-api/compare/0.1...0.2
[0.1]: https://github.com/youthweb/youthweb-api/compare/0.0.1...0.1
