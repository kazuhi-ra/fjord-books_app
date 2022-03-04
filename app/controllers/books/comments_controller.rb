class Books::CommentsController < ApplicationController
  def create
    book = Book.find(book_id)
    new_comment = book.comments.new(content: comment_params[:content],user: current_user)

    if new_comment.save
      redirect_to book, notice: t('controllers.common.notice_create', name: Comment.model_name.human)
    else
      redirect_to book, alert: new_comment.errors.full_messages
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def book_id
    params[:book_id]
  end
end
