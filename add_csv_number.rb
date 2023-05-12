# selenium-webdriverを取り込む


## CSVに格納されているリスト一覧に連番を振るコード(search_priority)


# biz.csv
require 'csv'

filename = "biz.csv"
lists = []
CSV.foreach(filename) do |row|
    lists.push(row)
end

File.delete(filename)

lists.each_with_index do |list,u|

    CSV.open(filename,'a',:encoding => "utf-8") do |csv|
        csv << [list[0], list[1], list[2], u + 1]
    end

end


kakuyasu.csv
require 'csv'

filename1 = "kakuyasu.csv"
lists = []
CSV.foreach(filename1) do |row|
    lists.push(row)
end

File.delete(filename1)

lists.each_with_index do |list,u|

    CSV.open(filename1,'a',:encoding => "utf-8") do |csv|
        csv << [list[0], list[1], list[2], u + 1]
    end

end

minshuku.csv


pension.csv
require 'csv'

filename3 = "pension.csv"
lists = []
CSV.foreach(filename3) do |row|
    lists.push(row)
end

File.delete(filename3)

lists.each_with_index do |list,u|

    CSV.open(filename3,'a',:encoding => "utf-8") do |csv|
        csv << [list[0], list[1], list[2], u + 1]
    end

end

# # ryokan.csv
require 'csv'

filename4 = "ryokan.csv"
lists = []
CSV.foreach(filename4) do |row|
    lists.push(row)
end

File.delete(filename4)

lists.each_with_index do |list,u|

    CSV.open(filename4,'a',:encoding => "utf-8") do |csv|
        csv << [list[0], list[1], list[2], u + 1]
    end

end