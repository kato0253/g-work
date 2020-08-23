module ArticlesHelper
  # def choose_new_or_edit
  #   if action_name == 'new' || action_name == 'confirm' || action_name == 'create'
  #     confirm_articles_path
  #   elsif action_name == 'edit'
  #     article_path
  #   end
  # end

  def confirm_new_or_edit
    unless @article.id? # params[:commit] == 'Create Blog'
      articles_path
    else
      article_path
    end
  end

  def confirm_form_method
    @articl.id ? 'patch' : 'post' # 作成時はpost, 編集時は patchを指定
  end
end
