class AnnotationsController < ApplicationController
  def create
    begin
      new_annotation = Annotation.create!(sheet_id: params[:sheet_id], content: params[:content])
      render json: {status: 'ok', annotation: new_annotation}
    rescue ActiveRecord::RecordInvalid
      render json: {status: 'err', msg: 'Failed to create annotation'}
    end
  end

  def index
    project_id = params[:project_id]
    begin
      project = Project.find(project_id)
      annotations = Annotation.where(project_id: project_id)
      render json: {status: 'ok', annotations: annotations}
    rescue ActiveRecord::RecordNotFound
      render json: {status: 'err', msg: 'Project ' + project_id.to_s + ' not found'}
    end
  end
end
