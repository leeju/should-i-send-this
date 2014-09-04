class DocumentsController < ApplicationController
  def index
    @document = Document.new()
  end

  def create
    p params

    # parse params // separate Doc creation and Version creation

  end

  def new
    @document = Document.new()
    @version = Version.new()
  end

  def edit
  end

  def show
    # make API call
    @document = Document.find(params[:id])
    @current_version = @document.versions.order(version_number: :desc).first
    @alchemist = fake_response
    #AlchemyAPI.new.keywords('text', @version.content, { 'sentiment'=>1 })

  end

  def update
  end

  def destroy
  end

  private

  def document_params
  end

  def fake_response
    {"status"=>"OK", "usage"=>"By accessing AlchemyAPI or using information generated by AlchemyAPI, you are agreeing to be bound by the AlchemyAPI Terms of Use: http://www.alchemyapi.com/company/terms.html", "url"=>"", "totalTransactions"=>"2", "language"=>"english", "keywords"=>[{"text"=>"SSSOO much sense", "relevance"=>"0.966367", "sentiment"=>{"type"=>"positive", "score"=>"0.703518"}}, {"text"=>"basic housing", "relevance"=>"0.800687", "sentiment"=>{"type"=>"positive", "score"=>"0.703518"}}, {"text"=>"Hurray america", "relevance"=>"0.794381", "sentiment"=>{"type"=>"positive", "score"=>"0.616026"}}, {"text"=>"bedfellows", "relevance"=>"0.724619", "sentiment"=>{"type"=>"positive", "score"=>"0.703518"}}, {"text"=>"landlord", "relevance"=>"0.71911", "sentiment"=>{"type"=>"positive", "score"=>"0.800225"}}, {"text"=>"Capitalism", "relevance"=>"0.6193", "sentiment"=>{"type"=>"positive", "score"=>"0.703518"}}]}
  end

end
