require 'yaml'
require 'twitter'

File.delete('yow_tweets.yml')
File.open('yow_tweets.yml', 'a') do |file|
  page_count = 1
  result = Twitter.search('yow_oz', :rpp => 100, :result_type => "recent", :page => page_count)
  file.write(result.to_yaml)

  while(result.count > 0) do
    page_count += 1
    result = Twitter.search('yow_oz', :rpp => 100, :result_type => "recent", :page => page_count)
    file.write(result.to_yaml)
  end
end
