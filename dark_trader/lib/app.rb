require 'pry'
require 'open-uri'
require 'nokogiri'
require 'rubygems'

def get_the_cryptonames()
    url = "https://coinmarketcap.com/all/views/all/"
    names = Array.new
    page = Nokogiri::HTML(open(url))
    getdata = page.xpath('//*[@class="currency-name-container link-secondary"]').each do |link|
        data = link.text
        names << data
    end
    return names
end

def get_the_cryptovalue()
    url = "https://coinmarketcap.com/all/views/all/"
    value = Array.new
    page = Nokogiri::HTML(open(url))
    getdataval = page.xpath('//*[@class="price"]').each do |val|
        dataval = val.text
        value << dataval
    end
    return value
end

def perform()
    the_crypto_value = get_the_cryptovalue
    the_crypto_names = get_the_cryptonames

    display = 0
    i = 0
    while i < the_crypto_names.length
        puts "########################"
        puts the_crypto_names[display] + the_crypto_value [display]
        display = display + 1
        i = i + 1
    end 
end

perform
