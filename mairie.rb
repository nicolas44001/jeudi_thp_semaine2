require 'nokogiri'
require 'open-uri'


def get_the_email__of_a_townhal_from_its_webpage(url)
    
 page = Nokogiri::HTML(open("http://annuaire-des-mairies.com#{url}"))
  page.css('td')[7].text
end


def get_all_the_urls_of_val_doise_townhalls
    page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
   @url=  page.css('a').map{|url| url['href']}[8,185]
end


def email 
    get_all_the_urls_of_val_doise_townhalls.map{|url| get_the_email__of_a_townhal_from_its_webpage(url)}
end
    
  
def name
    page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
    page.css('a').map{|url| url.text}[8,185]
end


puts Hash[name.zip(email)]
