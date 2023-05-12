# selenium-webdriverを取り込む
require 'selenium-webdriver'
require 'csv'

# ブラウザでURLに接続できるまで500秒まで待機する指示を出す
network = Selenium::WebDriver::Remote::Http::Default.new
network.read_timeout = 500

# ブラウザの指定(Chrome)
driver = Selenium::WebDriver.for :chrome, :http_client => network

(1..47).each do |q|
    (1..37).each do |u|

        begin
            
            if q < 10
                driver.get("https://www.jalan.net/kakuyasu/0#{q}0000/page#{u}.html")

                sleep(3)
                cur_url = driver.current_url
                print(cur_url)
            
                (1..30).each do |k|
                
                    url = driver.find_element(:xpath,"/html/body/div[2]/div[2]/div[1]/div[5]/ol/li[#{k}]/div[2]/div[1]/div/div[1]/h2/a").attribute("href")
                    p "#{k}個目のURLのxpathを取得しました"
                    name = driver.find_element(:xpath,"/html/body/div[2]/div[2]/div[1]/div[5]/ol/li[#{k}]/div[2]/div[1]/div/div[1]/h2/a").text
                    p "#{k}個目のnameのxpathを取得しました"
            
                    CSV.open('kakuyasu.csv','a',:encoding => "utf-8") do |csv|
                        csv << [cur_url, url, name]
                    end
            
                end

            else
                driver.get("https://www.jalan.net/kakuyasu/#{q}0000/page#{u}.html")

                sleep(3)
                cur_url = driver.current_url
                print(cur_url)
            
                (1..30).each do |k|
            
                    url = driver.find_element(:xpath,"/html/body/div[2]/div[2]/div[1]/div[5]/ol/li[#{k}]/div[2]/div[1]/div/div[1]/h2/a").attribute("href")
                    p "#{k}個目のURLのxpathを取得しました"
                    name = driver.find_element(:xpath,"/html/body/div[2]/div[2]/div[1]/div[5]/ol/li[#{k}]/div[2]/div[1]/div/div[1]/h2/a").text
                    p "#{k}個目のnameのxpathを取得しました"
            
                    CSV.open('kakuyasu.csv','a',:encoding => "utf-8") do |csv|
                        csv << [cur_url, url, name]
                    end
            
                end
            end

        rescue

            p "xpathを取得中でエラーを吐きました。URL: https://www.jalan.net/kakuyasu/0#{q}0000/page#{u}.html"
        
        end

    end

end
