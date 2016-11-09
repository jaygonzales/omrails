class IdeasController < ApplicationController
  # before_action :set_idea, only: [:show, :edit, :update, :destroy]

  before_action :authenticate_user!, except: [:index, :show]

  # GET /ideas
  # GET /ideas.json
  def index
    @ideas = Idea.all
  end

  # GET /ideas/1
  # GET /ideas/1.json
  def show
      @idea = Idea.find(params[:id])
  end

  # GET /ideas/new
  def new
    @idea = current_user.ideas.new
  end

  # GET /ideas/1/edit
  def edit
       @idea = current_user.ideas.find(params[:id])
  end

  # POST /ideas
  # POST /ideas.json
  def create
    @idea = current_user.ideas.new(idea_params)
    if @idea.save
      redirect_to @idea, notice: 'Idea was successfully created'
    else
      render :new
    # respond_to do |format|
    #   if @idea.save
    #     format.html { redirect_to @idea, notice: 'Idea was successfully created.' }
    #     format.json { render :show, status: :created, location: @idea }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
  end

  # PATCH/PUT /ideas/1
  # PATCH/PUT /ideas/1.json
  def update
    @idea = current_user.ideas.find(params[:id])
      if @idea.update(idea_params)
        redirect_to @idea, notice: 'Idea was successfully updated.'
      else
        render :edit
      end
  end

  # DELETE /ideas/1
  # DELETE /ideas/1.json
  def destroy
    @idea = current_user.ideas.find(params[:id])
    @idea.destroy
    redirect_to ideas_url, notice: 'Idea was successfully destroyed.'
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_idea
      @idea = Idea.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def idea_params
      params.require(:idea).permit(:title, :content, :value, :effort)
    end
end
