require './manual/parser.rb'
require 'pdf-reader'

class Manual

  include CarParser
  attr_accessor :reader, :pages, :cars

  def initialize(manual)
    @reader = PDF::Reader.new(manual)
    @pages = []
    @cars = []
  end

  def extract_data(range)
    read_pages(range)
    pages.each do |page|
      parse_page(page)
    end
  end

  def read_pages(range)
    reader.pages.take(range).each do |page|
      text = reshape_text(page.text)
      pages.push(text)
    end
  end

  # reshape the block of text so that only one column exists
  def reshape_text(raw_text)
    temp = []
    raw_text.lines.entries.slice(3..-5).each do |line|
      temp << line.slice!(50..-1)
    end.entries.concat(temp)
  end

end

class Car

  attr_accessor :make, :model, :year, :vin, :vid, :value, :trim

  def initialize(info)
    @make = info[:make]
    @model = info[:model]
    @trim = info[:trim]
    @year = info[:year]
    @vin = info[:vin]
    @vid = info[:vid]
    @value = info[:value]
  end

end

manual = Manual.new("2013_TAVT_Manual.pdf")
manual.extract_data(5)

manual.cars.each do |car|
  puts car.year
  puts car.make
  puts car.model
  puts car.trim
  puts car.vin
  puts car.vid
  puts car.value
  puts '-----------'
end
