require 'open-uri'

module RemoteLibraryHelper

  RESULTS_PER_PAGE = 20

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

    def initialize(total, pos = 1)
      @results = []
      @count = 0
      @pos = pos
      @total = total
    end

    def add_entry(title, author, publication, year)
      entry = ResultEntry.new(title, author, publication, year)
      @results << entry
      @count += 1
    end

    def get_paginated_results
      current_page = ((@pos - 1) / RESULTS_PER_PAGE) + 1
      WillPaginate::Collection.create(current_page, RESULTS_PER_PAGE, @total) do |pager|
        pager.replace(@results)
      end
    end
  end

  class ACMHelper
    def search(query, page)
      pos = page * RESULTS_PER_PAGE - RESULTS_PER_PAGE + 1
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
      results = SearchResults.new(total, pos)

      index = 0
      titles.each do |title|
        author_names = authors[index].css('a')
        if author_names.size > 1
          author_name = author_names[0].text + ' et al'
        elsif author_names.size == 1
          author_name = author_names[0].text
        else
          author_name = authors[index].text
        end
        results.add_entry(title.text, author_name, publications[index].text, years[index * 2].text.split[1])
        index += 1
      end
      results
    end
  end

end
