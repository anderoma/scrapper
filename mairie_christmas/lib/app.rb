require 'pry'
require 'open-uri'
require 'nokogiri'
require 'rubygems'


# get_city_valdoise_url vas chercher TOUS les urls de toutes les mairies du val d'oise
def get_city_valdoise_url
    valdoise_url = "http://annuaire-des-mairies.com/val-d-oise.html"
    city_urls = Array.new
    page = Nokogiri::HTML(open(valdoise_url))
    get_url = page.css('//[@class="lientxt"]').each do |link|
        url = link['href']
        city_urls << url
    end
    return city_urls
end

# get_city_email recupere les emails de chaques site de chaques mairie via les urls récupérés plus haut
def get_city_email(url)
    url1 = "https://www.annuaire-des-mairies.com/"
        emails = Array.new
        page = Nokogiri::HTML(open(url1 + url)) # ici on ajoute a l'url source l'extension correspondant a chacunes des villes
        page.xpath('//td[contains(text(), "@")]').each do |links|
            emails.push(links.text)
        end
    return emails
end

# finalement get_city_names va trouver et mettre dans un tableau tous les nom des villes de tout le val d'oise
def get_city_names
    valdoise_url = "http://annuaire-des-mairies.com/val-d-oise.html"
    names = Array.new
    name = Nokogiri::HTML(open(valdoise_url))
    name.xpath('//a[contains(@href, "95")]').each do |n|
        names.push(n.text)
    end
    return names
end

# perform execute et affiche l'ensemble du programme
def perform()
    hyp = get_city_valdoise_url
    city_name = get_city_names
    display = 0
    i = 0
    while display < get_city_valdoise_url.length
        puts "==============================================================="
        print city_name[display]
        print "  =>  "
        puts get_city_email(hyp[display])
        puts "==============================================================="
        i = i + 1
        display = display + 1
    end
end

perform
