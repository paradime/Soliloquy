class ThoughtsController < ApplicationController

  # GET /thoughts
  # GET /thoughts.json
  def index
    @thinkers = Thinker.all
    load_active_thinker

	  #Depending on our filter, show different thoughts
	  params[:show] && session[:show] = params[:show] #if params[:show] is nil, don't assign
	  case session[:show]
    when 'following'
      # Do a join across thinker
      @thoughts = Thought.joins(thinker: :followed).where(follows: {:follower_id => @active_thinker.id})
    when 'popular'
  	  #Show all thoughts with at least one thumb, sorted by number of thumbs descendingly
      @thoughts = Thought.joins(:thumbs).group(:thought).order("count(*) DESC")
    when 'mine'
      #TODO Load the active thinker's thoughts. Active thinker is in @active_thinker
      @thoughts = []
    else
      @thoughts = Thought.all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @thoughts }
    end
  end

  # GET /thoughts/1
  # GET /thoughts/1.json
  def show
    @thought = Thought.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @thought }
    end
  end

  # GET /thoughts/new
  # GET /thoughts/new.json
  def new
    @thought = Thought.new

    load_active_thinker

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @thought }
    end
  end

  # GET /thoughts/1/edit
  def edit
    @thought = Thought.find(params[:id])
  end

  # POST /thoughts
  # POST /thoughts.json
  def create
    load_active_thinker
    @thought = Thought.new(permitted_thought_params)
    @thought.thinker = @active_thinker

    respond_to do |format|
      if @thought.save
        format.html { redirect_to @thought, notice: 'Thought was successfully created.' }
        format.json { render json: @thought, status: :created, location: @thought }
      else
        format.html { render action: "new" }
        format.json { render json: @thought.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /thoughts/1
  # PUT /thoughts/1.json
  def update
    @thought = Thought.find(params[:id])

    respond_to do |format|
      if @thought.update(permitted_thought_params[:thought])
        format.html { redirect_to @thought, notice: 'Thought was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @thought.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /thoughts/1
  # DELETE /thoughts/1.json
  def destroy
    @thought = Thought.find(params[:id])
    @thought.destroy

    respond_to do |format|
      format.html { redirect_to thoughts_url }
      format.json { head :ok }
    end
  end

  # Change the active user
  # POST /thoughts/activate_thinker/1
  def activate_thinker
  	session[:active_thinker] = params[:active_thinker][:id]
    @active_thinker = Thinker.find(params[:active_thinker][:id])

    respond_to do |format|
      format.html { redirect_to :action => 'index' }
      format.json { render json: @thoughts }
    end
  end

  def thumbup
  	load_active_thinker
  	Thumb.create({thought_id: permitted_thought_params[:id], thinker: @active_thinker})

  	respond_to do |format|
      format.html { redirect_to :action => 'index' }
      format.json { render json: @thoughts }
    end
  end

  def thumbers
    load_active_thinker
    @thought = Thought.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @thoughts }
    end
  end

  private

  # This limits the parameters we allow regarding thoughts so you can't
  # supply arbitrary entries into the param hash. It's a security measure
  # Helps mitigate mass-assignment:
  #   http://edgeguides.rubyonrails.org/action_controller_overview.html#strong-parameters
  #   http://edgeapi.rubyonrails.org/classes/ActionController/StrongParameters.html
  #   http://en.wikipedia.org/wiki/Mass_assignment_vulnerability
  def permitted_thought_params
    params.require(:thought).permit(:active_thinker, :thought, :id, :thought_id, :show)
  end

end
