# selenium-webdriverを取り込む
require 'selenium-webdriver'
require 'csv'

# ブラウザでURLに接続できるまで500秒まで待機する指示を出す
network = Selenium::WebDriver::Remote::Http::Default.new
network.read_timeout = 500

# ブラウザの指定(Chrome)
driver = Selenium::WebDriver.for :chrome, :http_client => network
biz = "biz2.csv"
CSV.foreach(biz) do |row|
	url = row[1]
	begin
		driver.get(url)
	
		sleep(3)
		
		name = driver.find_element(:css, ".yado_header_hotel").text

		# ホテルのdescription
		desc_element = driver.find_element(:css, ".td03").text
		desc = desc_element.gsub(/宿泊のご予約はこちらから/, "")

		# 住所情報を取得
		table = driver.find_element(:css, ".jlnpc-shisetsu-accessparking-table")
		add_element = table.find_element(:tag_name, 'td')
		add = add_element.text.sub(/\n大きな地図をみる/, "")

		# platform
		platform = "jalan"

		CSV.open('biz_hotel.csv','a',:encoding => "utf-8") do |csv|
			csv << [url, name, desc, add, platform]
		end

	rescue
		p "取得中にエラーを吐きました。URL: #{url}"		
	end
end