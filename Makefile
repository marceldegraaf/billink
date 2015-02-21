.PHONY: test build-gem

default: test

test:
	bundle exec rspec spec

build-gem:
	gem build billink.gemspec
