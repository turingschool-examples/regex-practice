require 'open-uri'
class ScrapeController < ApplicationController

  def results
    person = params[:person]
    deets = devotion_details(person)
    @name = deets[:name]
    @enthusiasms = deets[:links].map do |link|
      EnthusiasmService.new({ link: link, name: @name })
    end
  end

  private

  def devotion_details(person)
    if person === "Fabio"
      fabio
    elsif person === "Taylor Swift"
      tswift
    end
  end

  def fabio
    {
      name: 'Fabio',
      links: ["http://www.fabioifc.com/", "http://www.fabioinc.com/", "http://www.fabioinc.com/Fabio_bio.html", "https://en.wikipedia.org/wiki/Fabio_Lanzoni", "https://johannalindsey.wordpress.com/category/cover-art/fabio/"]
    }
  end

  def tswift
    {
      name: 'Taylor Swift',
      links:  ["http://www.taylorswiftweb.net/", "http://taylorswiftfanclubofficial.webs.com/", "https://medium.com/@mikedao"]
    }
  end
end
