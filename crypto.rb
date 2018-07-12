require 'nokogiri'
require 'open-uri'

def crypto
    page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
   page.css('td.no-wrap.currency-name>a.currency-name-container.link-secondary').map{|crypto1| crypto1.text}
end


def cours
    page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
    page.css('td.no-wrap.text-right>a.price').map{|cours| cours.text}

end

puts Hash[crypto.zip(cours)]