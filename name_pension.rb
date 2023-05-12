# selenium-webdriverを取り込む
require 'selenium-webdriver'
require 'csv'

# ブラウザでURLに接続できるまで500秒まで待機する指示を出す
network = Selenium::WebDriver::Remote::Http::Default.new
network.read_timeout = 500

# ブラウザの指定(Chrome)
driver = Selenium::WebDriver.for :chrome, :http_client => network

# (1..47).each do |q|
#     begin
#         if q < 10
#             driver.get("https://www.jalan.net/a/pension/0#{q}0000/index.html")
#             sleep(3)
#             cur_url = driver.current_url
#             print(cur_url)
            
#             (3..32).each do |k|
#                 url = driver.find_element(:xpath,"/html/body/div[2]/div[2]/div[1]/div[#{k}]/div[2]/div[2]/div[1]/table/tbody/tr/td[1]/a").attribute("href")
#                 p "#{k}個目のURLのxpathを取得しました"
#                 name = driver.find_element(:xpath,"/html/body/div[2]/div[2]/div[1]/div[#{k}]/div[2]/div[2]/div[1]/table/tbody/tr/td[1]/a/h3").text
#                 p "#{k}個目のnameのxpathを取得しました"

#                 CSV.open('pension.csv','a',:encoding => "utf-8") do |csv|
#                     csv << [cur_url, url, name]
#                 end
#             end

#         else 
#             driver.get("https://www.jalan.net/a/pension/#{q}0000/index.html")
#             sleep(3)
#             cur_url = driver.current_url
#             print(cur_url)

#             (3..32).each do |k|
#                 url = driver.find_element(:xpath,"/html/body/div[2]/div[2]/div[1]/div[#{k}]/div[2]/div[2]/div[1]/table/tbody/tr/td[1]/a").attribute("href")
#                 p "#{k}個目のURLのxpathを取得しました"
#                 name = driver.find_element(:xpath,"/html/body/div[2]/div[2]/div[1]/div[#{k}]/div[2]/div[2]/div[1]/table/tbody/tr/td[1]/a/h3").text
#                 p "#{k}個目のnameのxpathを取得しました"

#                 CSV.open('pension.csv','a',:encoding => "utf-8") do |csv|
#                     csv << [cur_url, url, name]
#                 end
#             end
#         end

#     rescue
#         p "xpathを取得中でエラーを吐きました。URL: https://www.jalan.net/a/pension/#{q}0000/index.html"

    
#     end

# end

(1..47).each do |q|
    (2..15).each do |u|

        begin
            
            if q < 10
                driver.get("https://www.jalan.net/a/pension/0#{q}0000/index_#{u}.html")

                sleep(3)
                cur_url = driver.current_url
                print(cur_url)
            
                (3..32).each do |k|
                
                    url = driver.find_element(:xpath,"/html/body/div[2]/div[2]/div[1]/div[#{k}]/div[2]/div[2]/div[1]/table/tbody/tr/td[1]/a").attribute("href")
                    p "#{k}個目のURLのxpathを取得しました"
                    name = driver.find_element(:xpath,"/html/body/div[2]/div[2]/div[1]/div[#{k}]/div[2]/div[2]/div[1]/table/tbody/tr/td[1]/a/h3").text
                    p "#{k}個目のnameのxpathを取得しました"
            
                    CSV.open('pension.csv','a',:encoding => "utf-8") do |csv|
                        csv << [cur_url, url, name]
                    end
            
                end

            else
                driver.get("https://www.jalan.net/a/pension/#{q}0000/index_#{u}.html")

                sleep(3)
                cur_url = driver.current_url
                print(cur_url)
            
                (3..32).each do |k|
            
                    url = driver.find_element(:xpath,"/html/body/div[2]/div[2]/div[1]/div[#{k}]/div[2]/div[2]/div[1]/table/tbody/tr/td[1]/a").attribute("href")
                    p "#{k}個目のURLのxpathを取得しました"
                    name = driver.find_element(:xpath,"/html/body/div[2]/div[2]/div[1]/div[#{k}]/div[2]/div[2]/div[1]/table/tbody/tr/td[1]/a/h3").text
                    p "#{k}個目のnameのxpathを取得しました"
            
                    CSV.open('pension.csv','a',:encoding => "utf-8") do |csv|
                        csv << [cur_url, url, name]
                    end
            
                end
            end

        rescue

            p "xpathを取得中でエラーを吐きました。URL: https://www.jalan.net/a/pension/0#{q}0000/index_#{u}.html"
        
        end

    end

end
