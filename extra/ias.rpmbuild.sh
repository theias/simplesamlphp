#!/usr/bin/env bash
set -eu
set -o pipefail

vers="${1:-$(git tag | tail -n1)}"
mkdir -p ./rpmbuild/{BUILD,BUILDROOT,RPMS,SOURCES,SPECS,SRPMS}
mkdir -p "./simplesamlphp-${vers}"

cp -a . "/tmp/simplesamlphp-${vers}/"
tar -cf ./rpmbuild/SOURCES/"simplesamlphp-${vers}.tar.gz" "/tmp/simplesamlphp-${vers}"

cp extra/simplesamlphp.spec rpmbuild/SPECS/simplesamlphp.spec
sed -i "s/^%define version  .*\$/%define version   ${vers}/" rpmbuild/SPECS/simplesamlphp.spec
ls -R rpmbuild
fgrep '%define version' rpmbuild/SPECS/simplesamlphp.spec
rpmbuild --define "_topdir ${PWD}/rpmbuild"  -ba rpmbuild/SPECS/simplesamlphp.spec
