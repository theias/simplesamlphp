#!/usr/bin/env bash
set -eu
set -o pipefail

vers="$(git tag | tail -n1)"
git checkout "${vers}"
mkdir -p ./rpmbuild/{BUILD,BUILDROOT,RPMS,SOURCES,SPECS,SRPMS}
mkdir -p "./simplesamlphp-${vers}"

# git archive --format=tar "${vers}" | tar --directory="./archive/simplesamlphp-${vers}" -xf -
git clone . "./simplesamlphp-${vers}"
tar -cf ./rpmbuild/SOURCES/"simplesamlphp-${vers}.tar.gz" "./simplesamlphp-${vers}"

cp extra/simplesamlphp.spec rpmbuild/SPECS/simplesamlphp.spec
rpmbuild --define "_topdir ${PWD}/rpmbuild"  -ba rpmbuild/SPECS/simplesamlphp.spec
