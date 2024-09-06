# IAS Fork

This is the IAS fork of SimpleSAMLphp that includes workflows to build an RPM package of tagged releases.

It includes an alternate, working RPM spec file at `extra/simplesamlphp.spec`, a build script, and workflows to release RPMs created by that spec.

Our workflow should be to keep this branch in sync with upstream and to let Actions build new tagged releases.

```
# After cloning:
git remote add upstream https://github.com/simplesamlphp/simplesamlphp.git
git fetch --tags upstream
git push --tags
```

# SimpleSAMLphp

![Build Status](https://github.com/simplesamlphp/simplesamlphp/actions/workflows/php.yml/badge.svg)
[![Coverage Status](https://codecov.io/gh/simplesamlphp/simplesamlphp/branch/master/graph/badge.svg)](https://codecov.io/gh/simplesamlphp/simplesamlphp)
[![Scrutinizer Code Quality](https://scrutinizer-ci.com/g/simplesamlphp/simplesamlphp/badges/quality-score.png?b=master)](https://scrutinizer-ci.com/g/simplesamlphp/simplesamlphp/?branch=master)
[![Type coverage](https://shepherd.dev/github/simplesamlphp/simplesamlphp/coverage.svg)](https://shepherd.dev/github/simplesamlphp/simplesamlphp)
[![BrowserStack Status](https://automate.browserstack.com/badge.svg?badge_key=LzlCL29sZEVDRXJpdGtxZUdITFA3YjYyUFBBYkVVZDVDcG1YZXRaN2pvTT0tLVhCNzkwVUNGVFVjVFVicUg0R1BNR0E9PQ==--f9efb6f330bd98dd6e3c7b816ac2f0982275a872)](https://automate.browserstack.com/public-build/LzlCL29sZEVDRXJpdGtxZUdITFA3YjYyUFBBYkVVZDVDcG1YZXRaN2pvTT0tLVhCNzkwVUNGVFVjVFVicUg0R1BNR0E9PQ==--f9efb6f330bd98dd6e3c7b816ac2f0982275a872)

This is the official repository of the SimpleSAMLphp software.

* [SimpleSAMLphp homepage](https://simplesamlphp.org)
* [SimpleSAMLphp Downloads](https://simplesamlphp.org/download)

Please, [contribute](CONTRIBUTING.md)!
