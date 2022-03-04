# frozen_string_literal: true

class Reports::CommentsController < ApplicationController
  def create
    report = Report.find(report_id)
    new_comment = report.comments.new(content: comment_params[:content], user: current_user)

    if new_comment.save
      redirect_to report, notice: t('controllers.common.notice_create', name: Comment.model_name.human)
    else
      redirect_to report, alert: new_comment.errors.full_messages
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def report_id
    params[:report_id]
  end
end
