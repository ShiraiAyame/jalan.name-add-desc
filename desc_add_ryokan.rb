# selenium-webdriverを取り込む
require 'selenium-webdriver'
require 'csv'

# ブラウザでURLに接続できるまで500秒まで待機する指示を出す
network = Selenium::WebDriver::Remote::Http::Default.new
network.read_timeout = 500

# ブラウザの指定(Chrome)
driver = Selenium::WebDriver.for :chrome, :http_client => network

# 1.ホテルのURLからname、desc、address、platform（jalan）を取得してCSVに格納する

file = "ryokan.csv"
CSV.foreach(file) do |row|
	url = row[1]
	begin
		driver.get(url)
	
		sleep(3)
		
		name = driver.find_element(:css, ".yado_header_hotel").text

		# ホテルのdescription
		desc_element = driver.find_element(:css, ".td03").text
		desc_text = desc_element.gsub(/\n宿泊のご予約はこちらから/, "").delete("\n")

		# 住所情報を取得
		table = driver.find_element(:css, ".jlnpc-shisetsu-accessparking-table")
		add_element = table.find_element(:tag_name, 'td')
		add = add_element.text.sub(/\n大きな地図をみる/, "")

		# platform
		platform = "jalan"

		CSV.open('scrape_ryokan_desc_add.csv','a',:encoding => "utf-8") do |csv|
			csv << [url, name, desc_text, add, platform]
		end

	rescue Selenium::WebDriver::Error::NoSuchElementError

		p "取得中にエラーを吐きました。URL: #{url}"		
	
	end
end

# 2.全て取得し終えたら、search_priorityをくっつける

filename = "scrape_ryokan_desc_add.csv"
lists = []
CSV.foreach(filename) do |row|
    lists.push(row)
end

File.delete(filename)

lists.each_with_index do |list,u|

    CSV.open(filename,'a',:encoding => "utf-8") do |csv|
        csv << [list[0], list[1], list[2], list[3], list[4], u + 1]
    end

end