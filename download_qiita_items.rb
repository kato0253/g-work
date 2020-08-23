require 'open-uri'
require 'fileutils'
require 'json'
require 'date'

# アクセストークン
QIITA_ACCESS_TOKEN = '28efc75ae6e463708025aacabc14f744ad92c00a'

# 出力先ディレクトリ
OUT_DIR = File.expand_path('./qiita_items', __dir__)

# =====================================================================

# 出力先ディレクトリを作成
FileUtils.mkdir_p(OUT_DIR)

1.upto(100) do |i|
  # 記事一覧を取得
  response = URI.open(
    "https://qiita.com/api/v2/authenticated_user/items?page=#{i}&per_page=100",
    'Authorization' => "Bearer #{QIITA_ACCESS_TOKEN}"
  )
  items = JSON.parse(response.read)

  # 記事が見つからなかった場合は終了する
  break if items.empty?

  # 記事を書き出す
  items.each do |item|
    filename = "#{item['title']}.md"
    File.write(File.join(OUT_DIR, filename), item['body'])
  end
end
