require 'open-uri'

module RemoteLibraryHelper

  class ResultEntry
    attr_accessor :title, :author, :publication, :year

    def initialize(title, author, publication, year)
      @title = title
      @author = author
      @publication = publication
      @year = year
    end
  end

  class SearchResults
    attr_reader :results, :count, :pos, :total

    def initialize(pos = 1)
      @results = []
      @count = 0
      @pos = pos
      @total = 0
    end

    def add_entry(title, author, publication, year)
      entry = ResultEntry.new(title, author, publication, year)
      @results << entry
      @count += 1
    end
  end

  class ACMHelper
    def search(query, pos = 1)
      results = SearchResults.new

      doc = Nokogiri::HTML(open("http://dl.acm.org/results.cfm?query=#{query}&start=#{pos}"))
      error = doc.css("span[style='background-color:yellow']")
      if !error.empty?
        return results
      end

      core = doc.xpath('//body/div/table/tr[3]/td/table/tr[3]/td[2]/table')
      titles = doc.css("a[class='medium-text']")
      authors = doc.css("div[class='authors']")
      years = core.css("table[style='padding: 5px; 5px; 5px; 5px;'] tr[valign='top'] td[class='small-text']")
      publications = doc.css("div[class='addinfo']")

      index = 0
      titles.each do |title|
        author_names = authors[index].css('a')
        if author_names.size > 1
          author_name = author_names[0].text + ' et al'
        else
          author_name = author_names[0].text
        end
        results.add_entry(title.text, author_name, publications[index].text, years[index * 2].text.split[1])
        index += 1
      end
      results
    end
  end

end
