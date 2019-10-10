require 'pry'
require 'open-uri'
require 'nokogiri'
require 'rubygems'

# SORTIE ==> Un array de hash repertoriant le cours de toutes les cryptomonnaies avec leur noms! le tout présenté proprement

# commencer par définir une méthode qui scrappe les noms
## puis une méthode qui scrappe les valeurs
#### pour se faire il faut utiliser Xpath de maniere précise afin de pointer au bon endroit 

# astuce -> mettre des puts pout afficher quelque chose a chaque recuperation de donnée

# puis un perfom qui execute tous et display le resutat 

def get_the_cryptonames()
    url = "https://coinmarketcap.com/all/views/all/"
    names = Array.new
    page = Nokogiri::HTML(open(url))
    getdata = page.css('//*[@id="currencies-all"]/tbody/tr/td.no-wrap.currency-name/a').each do |link|
        data = link.text
        names << data
    end
    return names
end

def get_the_cryptovalue()
    url = "https://coinmarketcap.com/all/views/all/"
    value = Array.new
    page = Nokogiri::HTML(open(url))
    getdataval = page.css('//*[@id="currencies-all"]/tbody/tr/td[5]').each do |val|
        dataval = val.text
        value << dataval
    end
    return value
end

def perform()
    the_crypto_value = get_the_cryptovalue
    the_crypto_names = get_the_cryptonames

    d = 0  # d stand for display and represent what will be on screen
    c = 0  # c represent the counting or calculator 
    while c < the_crypto_names.length
        puts "########################"
        puts the_crypto_names[d] + the_crypto_value [d]
        puts "########################"
        d = d + 1
        c = c + 1
    end 
end

perform