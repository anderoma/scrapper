require 'pry'
require 'open-uri'
require 'nokogiri'
require 'rubygems'

# définir une méthode qui vas scrapper les noms des députés

def get_dep_name
    dep_name = Array.new
    page = Nokogiri::HTML(open('https://wiki.laquadrature.net/Contactez_vos_d%C3%A9put%C3%A9s'))
    page.xpath('/html/body/div[1]/div[1]/div/div[2]/div[4]/div/ul/li').each do |dep|
        dep_name.push(dep.text)
    end
    return dep_name
end

def perform
    i = 0
    display = 3
    while i < get_dep_name.length
        puts "----------------------------------------------------------------------------------------"
        puts get_dep_name[display]
        puts "----------------------------------------------------------------------------------------"
        i = i + 1
        display = display + 1
    end
end

perform
