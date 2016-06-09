ENTHUSIASM_WORDS = ['wow', 'yay', 'yeah', 'omg', 'kittens']

class EnthusiasmService

  attr_reader :text_content, :link

  def initialize(params)
    @link = params[:link]
    @text_content =  @link ? scrape_text(@link) : params[:text]
  end

  def name_count(name)
    @text_content.scan(/#{name}/i).size
  end

  def usage_of_known_enthusiastic_words
    joined_enthusiasm_words = ENTHUSIASM_WORDS.join('|')
    regex = Regexp.new(joined_enthusiasm_words, 'i')
    @text_content.scan(regex).size
  end

  private

  def scrape_text(link)
    html = Nokogiri::HTML(open(link))
    html.at('body').inner_text.gsub(/\n/,"")
  end
end
