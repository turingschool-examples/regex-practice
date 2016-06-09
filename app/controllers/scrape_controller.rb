require 'open-uri'
class ScrapeController < ApplicationController

  def results
    person = params[:person]
    deets = devotion_details(person)
    @name = deets[:name]
    @enthusiasms = deets[:links].map do |link|
      EnthusiasmService.new({ link: link, name: @name, sample_text: deets[:sample_text] })
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
      links: ["http://www.fabioifc.com/", "http://www.fabioinc.com/", "http://www.fabioinc.com/Fabio_bio.html", "https://en.wikipedia.org/wiki/Fabio_Lanzoni", "https://johannalindsey.wordpress.com/category/cover-art/fabio/"],
      sample_text: 'eople magazine once called Fabio, “the man with a face that has launched a thousand romance novels and a chest on which a squadron of fighter planes could land with no problem.” Fabio is an Italian fashion model, spokesperson, author, and actor. He has appeared in numerous films and television shows, including “Zoolander,” “The Bold & the Beautiful” and Terrence Malick’s “Knight of Cups.”                  In addition to “Your Perfect Valentine’s Date” with Fabio, this month Feeln warms up the virtual world with some new additions to their vast library of heartfelt romantic titles. The service is the exclusive streaming destination for the esteemed Hallmark “Hall of Fame” films. Feeln organizes its library of hundreds of movies and series into playlists that fit the viewer’s mood, so whether it’s girls’ night or date night, Feeln always delivers the right entertainment.'
    }
  end

  def tswift
    {
      name: 'Taylor Swift',
      links:  ["http://taylorswiftfanclubofficial.webs.com/", "https://medium.com/@mikedao"],
      sample_text: "She's beautiful. She's perfect.Join us and love Taylor forever @ Taylor Swift Fan Club~Help our facebook page get 15k likes before 13 May, before our first anniversary~ Help us reach our goal, just like our facebook page, we need your help to show Taylor that we are her Swifties and We Love Her Forever And Always. Always Remember to be Fearless. She Taught Us to Speak Now and that Love is Red. Remember, she's awesome and beautiful and perfect and...undescribable, Love Taylor Forever"
    }
  end
end
