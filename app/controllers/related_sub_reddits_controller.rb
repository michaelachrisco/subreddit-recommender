class RelatedSubRedditsController < ApplicationController
  before_action :set_related_sub_reddit, only: [:show, :edit, :update, :destroy]

  # GET /related_sub_reddits
  # GET /related_sub_reddits.json
  def index
    @related_sub_reddits = RelatedSubReddit.all
  end

  # GET /related_sub_reddits/1
  # GET /related_sub_reddits/1.json
  def show
  end

  # GET /related_sub_reddits/new
  def new
    @related_sub_reddit = RelatedSubReddit.new
  end

  # GET /related_sub_reddits/1/edit
  def edit
  end

  # POST /related_sub_reddits
  # POST /related_sub_reddits.json
  def create
    @related_sub_reddit = RelatedSubReddit.new(related_sub_reddit_params)

    respond_to do |format|
      if @related_sub_reddit.save
        format.html { redirect_to @related_sub_reddit, notice: 'Related sub reddit was successfully created.' }
        format.json { render :show, status: :created, location: @related_sub_reddit }
      else
        format.html { render :new }
        format.json { render json: @related_sub_reddit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /related_sub_reddits/1
  # PATCH/PUT /related_sub_reddits/1.json
  def update
    respond_to do |format|
      if @related_sub_reddit.update(related_sub_reddit_params)
        format.html { redirect_to @related_sub_reddit, notice: 'Related sub reddit was successfully updated.' }
        format.json { render :show, status: :ok, location: @related_sub_reddit }
      else
        format.html { render :edit }
        format.json { render json: @related_sub_reddit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /related_sub_reddits/1
  # DELETE /related_sub_reddits/1.json
  def destroy
    @related_sub_reddit.destroy
    respond_to do |format|
      format.html { redirect_to related_sub_reddits_url, notice: 'Related sub reddit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_related_sub_reddit
    @related_sub_reddit = RelatedSubReddit.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def related_sub_reddit_params
    params.require(:related_sub_reddit).permit(:sub_reddit_id, :weight, :sub_reddit_relation_id)
  end
end
