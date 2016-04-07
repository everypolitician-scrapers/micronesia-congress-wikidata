#!/bin/env ruby
# encoding: utf-8

require 'wikidata/fetcher'

names = EveryPolitician::Wikidata.wikipedia_xpath( 
  url: 'https://en.wikipedia.org/wiki/Congress_of_the_Federated_States_of_Micronesia',
  after: '//h2[contains(.,"Members")]',
  before: '//h2[contains(.,"See also")]',
  xpath: './/table//td[position() = last() - 2]//a[not(@class="new")]/@title',
) 

EveryPolitician::Wikidata.scrape_wikidata(names: { en: names })
