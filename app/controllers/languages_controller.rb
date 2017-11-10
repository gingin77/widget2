class LanguagesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @languages = Language.all
  end

  def new
  end

  def create
    @language = Language.new(language_params)
    @language.save
    redirect_to @language
  end

  def show
    # layout false
    @language = Language.find params[:id]
    # format.js {}
    # respond_to do |format|
    #   format.json { render json: @your_return_object }
    #   format.js {}
    # end
  end

  private
  def language_params
    params.require(:language).permit(:title, :text)
  end
end

#
# respond_to do |format|
#   format.js do
#     # all your action code goes here...
#   end
# end
