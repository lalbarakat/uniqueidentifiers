class CheckoutsController < AuthenticatedController
  # GET /checkouts
  # GET /checkouts.json
  def index
    @checkouts = Checkout.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @checkouts }
    end
  end

  # GET /checkouts/1
  # GET /checkouts/1.json
  def show
    @checkout = Checkout.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @checkout }
    end
  end

  # GET /checkouts/new
  # GET /checkouts/new.json
  def new
    @student = Student.new
    @students = Student.all
    @uins = @students.collect { |student| student.uin }
    @firstnames = @students.collect { |student| student.firstname }
    @lastnames = @students.collect { |student| student.lastname }
    @emails = @students.collect { |student| student.email }
    @phones = @students.collect { |student| student.phonenumber }

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @checkout }
    end
  end

  # GET /checkouts/1/edit
  def edit
    @checkout = Checkout.find(params[:id])
    @student = @checkout.student
    @students = Student.all
    @uins = @students.collect { |student| student.uin }
    @firstnames = @students.collect { |student| student.firstname }
    @lastnames = @students.collect { |student| student.lastname }
    @emails = @students.collect { |student| student.email }
    @phones = @students.collect { |student| student.phonenumber }
  end
  
  # POST /add_items
  def add_items
  	@student = Student.find_by_uin(params[:uin]) || Student.new(:firstname => params[:firstname], :lastname => params[:lastname],
  								 :email => params[:email], :phonenumber => params[:phonenumber], :uin => params[:uin])
    	if !@student.valid?
	        @students = Student.all
	        @uins = @students.collect { |student| student.uin }
	        @firstnames = @students.collect { |student| student.firstname }
	        @lastnames = @students.collect { |student| student.lastname }
	        @emails = @students.collect { |student| student.email }
	        @phones = @students.collect { |student| student.phonenumber }
    		render action: "new"
    	end
    	@checkout = Checkout.new
	@checkout.student = @student
  end
  
  # POST /add_dates
  def add_dates
    @student = Student.find_by_uin(params[:uin]) || Student.new(params[:student])
    
    # Get the scanned items
    begin
        @items = Item.find(params[:item_ids])
    rescue ActiveRecord::RecordNotFound => e
    	@checkout = Checkout.new
    	@checkout.errors.add("Items", ": Some of the items scanned were not found in the system: " + e.message)
    	return render action: "add_items"
    end
    @checkedout_items = @items.collect do |item| 
    	if(CheckedoutItem.find_by_item_id(item.id))
    		# Error item already checked out
    		@checkout = Checkout.new
    		@checkout.errors.add("Items", ": Item is already checked out: " + item.name)
    		return render action: "add_items"
    	else
	     	checkedout = CheckedoutItem.new
	    	checkedout.item_id = item.id;
	    	checkedout.item = item
	    	return checkedout
    	end
    end
    @checkout = Checkout.new
    @checkout.student = @student
    @checkout.checkedout_items = @checkedout_items
  end
  
  # POST /review
  def review
    begin
        @checkout = Checkout.new(params[:checkout])
    rescue ActiveRecord::RecordNotFound => e
    	@checkout = Checkout.new(params[:checkout])
    	@checkout.errors.add("Items", ": Some of the items scanned were not found in the system: " + e.message)
    	return render action: "add_dates"
    end
  end

  # POST /checkouts
  # POST /checkouts.json
  def create
    begin
        @checkout = Checkout.new(params[:checkout])
    rescue ActiveRecord::RecordNotFound => e
    	@checkout = Checkout.new(params[:checkout])
    	@checkout.errors.add("Items", ": Some of the items scanned were not found in the system: " + e.message)
    	return render action: "review"
    end

    respond_to do |format|
      if @checkout.save
        format.html { redirect_to @checkout, notice: 'Checkout was successfully created.' }
        format.json { render json: @checkout, status: :created, location: @checkout }
      else
        format.html { render action: "review" }
        format.json { render json: @checkout.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def checkin
  	#render checkin view
  end
  
  def review_checkin
  	item_id = params[:item_ids][0]
  	@items = Item.find_all_by_id(params[:item_ids])
  	@checkout = Checkout.joins(:checkedout_items).where('checkedout_items.item_id = ? and checkouts.id = checkedout_items.checkout_id and checkouts.student_id is not null', item_id).first
  	@student = @checkout.student
  end

  # PUT /checkouts/1
  # PUT /checkouts/1.json
  # CHECKIN
  def update
    @checkout = Checkout.find_by_id(params[:id])

    # Update all items as checked in
    params[:item_ids].each do |item|
    	coi = @checkout.checkedout_items.where('checkedout_items.item_id = ?', item).first
    	if coi.nil?
    		#ERROR item not part of checkout
    	end
    	coi.update_attribute('status', 1)
    end
    
    # Check if the full checkout is finished
    is_checkout_finished = true
    @checkout.checkedout_items.each do |coi|
	if(coi.status == 0)
		is_checkout_finished = false
	end
    end
    
    if(is_checkout_finished)
    	@checkout.update_attribute('status', 1)
    end
    
    respond_to do |format|
        format.html { redirect_to @checkout, notice: 'Checkout was successfully updated.' }
        format.json { head :no_content }
    end
  end

  # DELETE /checkouts/1
  # DELETE /checkouts/1.json
  def destroy
    @checkout = Checkout.find(params[:id])
    @checkout.destroy

    respond_to do |format|
      format.html { redirect_to checkouts_url }
      format.json { head :no_content }
    end
  end
end
