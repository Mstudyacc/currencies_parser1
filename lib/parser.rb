require 'rexml/document'
require 'date'



class Parser

	def initialize(params)
    @id = params[:id]
    @num_code = params[:num_code]
    @name = params[:name]
    @value = params[:value]
  end

  # Метод класса from_xml_node возвращает экземпляр класса, прочитанные из
  # элемента XML-структуры с параметрами
  def self.from_xml(node)
    new(
      id: node.elements['//Valute'].attributes['ID'].to_i,
      num_code: node.elements['//Valute/NumCode'],
      name: node.elements['//Valute/Name'],
      value: node.elements['//Valute/Value']
    )
  end

  def to_s
  	puts "#{@num_code} + #{@name}"
  end

end