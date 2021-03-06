ENTHUSIASM_WORDS = ['wow', 'yay', 'yeah', 'omg', 'kittens']

class EnthusiasmService

  attr_reader :text_content, :link, :sample_text

  def initialize(params)
    @sample_text = params[:sample_text]
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
    begin
      html = Nokogiri::HTML(open(link))
      text = html.at('body').inner_text.gsub(/\n/,"")
    rescue
      @sample_text || ''
    end
  end
end
