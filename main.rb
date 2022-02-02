require_relative 'lib/parser'
require 'net/http'
require 'rexml/document'

URL = 'http://www.cbr.ru/scripts/XML_daily.asp'.freeze

response = Net::HTTP.get_response(URI.parse(URL))
doc = REXML::Document.new(response.body)

# Достаем все XML-теги <Valute> внутри тега <ValCurs> и преобразуем их в массив
valute_nodes = doc.elements['ValCurs'].elements.to_a


valute_name = doc.elements['//Valute/Name']

valute_nodes.each do |node|
	puts Parser.from_xml(node)
	puts
end




#forecast_nodes.each do |node|
  #puts MeteoserviceForecast.from_xml(node)
 # puts
#end