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
    attr_reader :results, :count, :pos, :total, :results_per_page

    def initialize(total, pos = 1, results_per_page = 20)
      @results = []
      @count = 0
      @pos = pos
      @total = total
      @results_per_page = results_per_page
    end

    def add_entry(title, author, publication, year)
      entry = ResultEntry.new(title, author, publication, year)
      @results << entry
      @count += 1
    end
  end

  class ACMHelper
    def search(query, pos = 1)
      doc = Nokogiri::HTML(open("http://dl.acm.org/results.cfm?query=#{query}&start=#{pos}"))
      error = doc.css("span[style='background-color:yellow']")
      unless error.empty?
        return SearchResults.new(0)
      end

      core = doc.xpath('//body/div/table/tr[3]/td/table/tr[3]/td[2]/table')
      titles = doc.css("a[class='medium-text']")
      authors = doc.css("div[class='authors']")
      years = core.css("table[style='padding: 5px; 5px; 5px; 5px;'] tr[valign='top'] td[class='small-text']")
      publications = doc.css("div[class='addinfo']")
      results_count = doc.css("table[class='small-text'] tr[valign='top'] td")

      total = results_count[0].text.split.last.gsub(',','').to_i
      results = SearchResults.new(total, pos, 20)

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
