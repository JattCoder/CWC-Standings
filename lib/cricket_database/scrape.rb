class Scrape
    
    attr_accessor :teams

    def initialize
        collect
    end

    def collect
        index_url = "https://www.cricketworldcup.com/standings"
        html = open(index_url)
        doc = Nokogiri::HTML(html)
        doc.css('.table-body').each do |element|
            attributes = Array.new
            position = element.css('td')[0].text
            country = element.css('a span')[0].text.strip
            initials = element.css('a span')[1].text
            played = element.css('td')[2].text
            won = element.css('td')[3].text
            lost = element.css('td')[4].text
            draw = element.css('td')[5].text
            points = element.css('td')[8].text
            attributes.push(country,initials,position,played)
            attributes.push(won,lost,draw,points)
            @teams = Team.new.create_from_hash(attributes)
        end
    end
end