```
def create
    @comment = @article.comments.build(comment_params)
end
```
上記の形から@comment変数にuser_idの入れ方が分からなかったので備忘録として
※アソシエーション後の話

結論

@commentはオブジェクトなので、.user_idメソッドを使用しcurrent_user.idを代入すれば良かった。
@comment.user_id = current_user.idの様な形

最終形

```
def create
    @comment = @article.comments.build(comment_params)
    @comment.user_id = current_user.id
end
```

基礎的な事が分かっていなかった・・・
オブジェクトとメソッドの関係を復習しよう
