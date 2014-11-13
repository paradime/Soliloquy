class ThinkersController < ApplicationController
  # GET /thinkers
  # GET /thinkers.json
  def index
    @thinkers = Thinker.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @thinkers }
    end
  end

  # GET /thinkers/1
  # GET /thinkers/1.json
  def show
    @thinker = Thinker.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @thinker }
    end
  end

  # GET /thinkers/new
  # GET /thinkers/new.json
  def new
    @thinker = Thinker.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @thinker }
    end
  end

  # GET /thinkers/1/edit
  def edit
    @thinker = Thinker.find(params[:id])
  end

  # POST /thinkers
  # POST /thinkers.json
  def create
    @thinker = Thinker.new(permitted_thinkers_params)

    respond_to do |format|
      if @thinker.save
        format.html { redirect_to @thinker, notice: 'Thinker was successfully created.' }
        format.json { render json: @thinker, status: :created, location: @thinker }
      else
        format.html { render action: "new" }
        format.json { render json: @thinker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /thinkers/1
  # PUT /thinkers/1.json
  def update
    @thinker = Thinker.find(params[:id])

    respond_to do |format|
      if @thinker.update(permitted_thinkers_params)
        format.html { redirect_to @thinker, notice: 'Thinker was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @thinker.errors, status: :unprocessable_entity }
      end
    end
  end

  def follow
    load_active_thinker
    @thinker = Thinker.find(permitted_thinkers_params[:id])
    Follow.create(follower: @active_thinker, followee: @thinker)

    respond_to do |format|
      format.html { render :action => 'show' }
      format.json { render json: @thinker }
    end
  end

  private
  # This limits the parameters we allow regarding thoughts so you can't 
  # supply arbitrary entries into the param hash. It's a security measure
  # Helps mitigate mass-assignment: 
  #   http://edgeguides.rubyonrails.org/action_controller_overview.html#strong-parameters
  #   http://edgeapi.rubyonrails.org/classes/ActionController/StrongParameters.html
  #   http://en.wikipedia.org/wiki/Mass_assignment_vulnerability
  def permitted_thinkers_params
    params.require(:thinker).permit(:id, :name, :email, :url, :image_url)
  end

end
