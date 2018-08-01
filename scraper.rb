#!/bin/env ruby
# encoding: utf-8

require 'everypolitician'
require 'wikidata/fetcher'

names = EveryPolitician::Wikidata.wikipedia_xpath(
  url: 'https://en.wikipedia.org/wiki/Congress_of_the_Federated_States_of_Micronesia',
  after: '//h2[contains(.,"Members")]',
  before: '//h2[contains(.,"See also")]',
  xpath: './/table//td[position() = last() - 2]//a[not(@class="new")]/@title',
)
existing = EveryPolitician::Index.new.country("Micronesia").lower_house.popolo.persons.map(&:wikidata).compact

EveryPolitician::Wikidata.scrape_wikidata(ids: existing, names: { en: names })
