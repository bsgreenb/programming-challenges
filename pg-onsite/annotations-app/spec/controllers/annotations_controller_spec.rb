require 'rails_helper'

RSpec.describe AnnotationsController, type: :controller do
  describe 'create' do
    before do
      @project = Project.create!(name: 'Test Project')
      @sheet = Sheet.create!(project: @project)
    end

    it 'renders the created annotation on success' do
      new_annotation = Annotation.new

      allow(Annotation).to receive(:create!).and_return(new_annotation)

      post :create, {sheet_id: @sheet.id, content: 'Test Content'}, :format => :json

      expected_response = {"status": 'ok', 'annotation': JSON.parse(new_annotation.to_json)}
      expect(JSON.parse(response.body).symbolize_keys).to eq(expected_response.symbolize_keys)
    end

    it 'renders error when it fails to create annotation' do
      # allow(dbl).to receive(:foo).and_raise("boom")
      allow(Annotation).to receive(:create!).and_raise(ActiveRecord::RecordInvalid)

      post :create, {sheet_id: @sheet.id, content: 'Test Content'}, :format => :json

      expected_response = {'status': 'err', 'msg': 'Failed to create annotation'}

      expect(JSON.parse(response.body).symbolize_keys).to eq(expected_response.symbolize_keys)
    end
  end

  describe 'index' do
    it 'renders the list of annotations on success' do
      existing_project = Project.new
      project_annotations = [Annotation.new, Annotation.new]
      allow(Project).to receive(:find).and_return(existing_project)
      allow(Annotation).to receive(:where).and_return(project_annotations)

      get :index, {project_id: 1}

      expected_response = {status: 'ok', annotations: JSON.parse(project_annotations.to_json)}

      expect(JSON.parse(response.body).symbolize_keys).to eq(expected_response.symbolize_keys)
    end

    it 'renders an error when the project does not exist' do
      allow(Project).to receive(:find).and_raise(ActiveRecord::RecordNotFound)

      get :index, {project_id: 1}

      expected_response = {status: 'err', msg: 'Project 1 not found'}
      expect(JSON.parse(response.body).symbolize_keys).to eq(expected_response.symbolize_keys)
    end
  end
end
