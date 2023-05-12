# # selenium-webdriverを取り込む
# require 'selenium-webdriver'
# require 'csv'

# # ブラウザでURLに接続できるまで500秒まで待機する指示を出す
# network = Selenium::WebDriver::Remote::Http::Default.new
# network.read_timeout = 500

# # ブラウザの指定(Chrome)
# driver = Selenium::WebDriver.for :chrome, :http_client => network
# f = "biz.csv"

# CSV.foreach(f) do |row|
    
#     begin
#         driver.get(row[1])
        
#         cur_url = driver.current_url
#         sleep(3)

       
#             name = driver.find_element(:css, ".yado_header_hotel").text
#             p "nameを取得しました"
#             desc = driver.find_element(:css, ".td03").text
#             p "descを取得しました"
            
#             table = driver.find_element(:class, “jlnpc-shisetsu-accessparking-table”)
#             add_element = table.find_element(:xpath, “//td[contains(., ‘住所’)]“)
#             p "add_element"

#             # CSV.open('test2.csv','a',:encoding => "utf-8") do |csv|

#             #     csv << [cur_url, name, desc, add]       
           
        

#         end
    
#     rescue
        
#         p "エラーが発生しました"
       
#     end
# end

# selenium-webdriverを取り込む
require 'selenium-webdriver'
require 'csv'

# ブラウザでURLに接続できるまで500秒まで待機する指示を出す
network = Selenium::WebDriver::Remote::Http::Default.new
network.read_timeout = 500

# ブラウザの指定(Chrome)
driver = Selenium::WebDriver.for :chrome, :http_client => network
biz = "biz.csv"

	CSV.foreach(biz) do |row|
		driver.get(row[1])
			cur_url = driver.current_url

			sleep(3)
			
			name = driver.find_element(:css, ".yado_header_hotel").text

			# ホテルのdescription
			desc_element = driver.find_element(:css, ".td03").text
			desc = desc_element.text.sub(/宿泊のご予約はこちらから/, "")

			# 住所情報を取得(xpath)
			table = driver.find_element(:css, ".jlnpc-shisetsu-accessparking-table")
			add_element = table.find_element(:xpath, "//th[contains(text(), '住所')]/following-sibling::td[1]")
			add = add_element.text.sub(/大きな地図をみる/, "")

			CSV.open('test2.csv','a',:encoding => "utf-8") do |csv|
					csv << [cur_url, name, desc, add]
			end
	end