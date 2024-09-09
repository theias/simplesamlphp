#!/usr/bin/env bash
set -eu
set -o pipefail

vers="${1:-$(git tag | tail -n1)}"
mkdir -p ./rpmbuild/{BUILD,BUILDROOT,RPMS,SOURCES,SPECS,SRPMS}
mkdir -p "./simplesamlphp-${vers}"

cp -a . "/tmp/simplesamlphp-${vers}/"
tar -cf ./rpmbuild/SOURCES/"simplesamlphp-${vers}.tar.gz" -C /tmp "simplesamlphp-${vers}"


cp extra/ias.simplesamlphp.spec rpmbuild/SPECS/simplesamlphp.spec
sed -i "s/^%define version  .*\$/%define version   ${vers}/" rpmbuild/SPECS/simplesamlphp.spec
ls -R rpmbuild
grep -F '%define version' rpmbuild/SPECS/simplesamlphp.spec
rpmbuild -v --define "_topdir ${PWD}/rpmbuild"  -ba rpmbuild/SPECS/simplesamlphp.spec
echo 'done!'
