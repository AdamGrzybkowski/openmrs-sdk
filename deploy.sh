#!/usr/bin/env bash
mvn versions:set -DnewVersion=$TRAVIS_TAG
git tag -d $TRAVIS_TAG
git push --quiet "https://$GITHUB_API_KEY@github.com/$TRAVIS_REPO_SLUG.git" :refs/tags/$TRAVIS_TAG > /dev/null 2>&1
git add -u
git commit -m "Releasing $TRAVIS_TAG"
git tag $TRAVIS_TAG
git push --quiet "https://$GITHUB_API_KEY@github.com/$TRAVIS_REPO_SLUG.git" $TRAVIS_TAG > /dev/null 2>&1
mvn deploy -Pbintray -DskipTests