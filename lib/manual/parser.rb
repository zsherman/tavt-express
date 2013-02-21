module CarParser

  attr_accessor :cur_make, :cur_model, :cur_year, :cur_vin

  def parse_page(page)
    page.each do |line|
      # puts line # debugging

      next if line.class == NilClass # weird bug w/ pdf-reader?
      next if line.match(/^\s+$/)

      next if car?(line)
      next if model?(line)
      next if make?(line)
    end
  end

  def make?(line)
    return @cur_make = line.sub("AUTOMOBILES","").strip if line.match(/AUTOMOBILES/)
    return false
  end

  def model?(line)
    return false if line.match(/(AUTOMOBILES|-{43}|_{43}|Yr Model)/)

    match_data = line.strip.match(/([\w\s]+)/)
    @cur_model = match_data[0].sub("continued", "").strip
  end

  def car?(line)
    data = line.match(/(?<year>\d{,2})(?<trim>.+)\s+(?<vin>(\w\s{,1}){8}-\w)\s+(?<vid>.{6})\s+(?<value>\d+)/)

    if data
      @cur_year = data[:year] if !data[:year].empty?
      cars << Car.new(make:  cur_make,
                      model: cur_model,
                      year:  cur_year,
                      trim:  data[:trim].strip,
                      vin:   data[:vin].sub(" ", ""),
                      vid:   data[:vid],
                      value: data[:value])

      return true
    else
      return false
    end
  end

end
