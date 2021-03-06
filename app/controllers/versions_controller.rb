class VersionsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def create
  end

  def new
    @document = Document.find(params[:document_id])
    @version = Version.new
    @most_recent_version = @document.versions.last
    @comments = @most_recent_version.comments
  end

  def edit
  end

  def show
    @version = Version.find(params[:id])
    @document = Document.find(@version.document)
    @versions = @document.versions
    @first_version = @document.versions.first

    @comments = @version.comments.display_order
    @comment = @version.comments.build

    @alchemist = AlchemyData.new(@version.content)
    # UNCOMMENT BELOW FOR NON-API CALL DEVELOPER MODE
    # @alchemist = ErrorAlchemist.new

    unless @alchemist
      @alchemist = ErrorAlchemist.new
    end

    @concepts = @alchemist.concepts
  end

  def update
  end

  def destroy
    version = Version.find(params[:id])

    document = Document.find(version.document_id)

    latest_version = document.versions.last

    if version == latest_version
      version.destroy
      redirect_to document_path(document)
    else
      version.destroy
      redirect_to version_path(latest_version)
    end
  end

  private

  def version_params
    content = params[:document][:versions][:content]
    {content: content}
  end
end


