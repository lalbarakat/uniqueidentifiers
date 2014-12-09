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
  
  # POST /review
  def review
    @checkedout_items = params[:checkout][:checkedout_items_attributes].collect do |checkedout_item_attr_hash|
    	checkedout_item_attr = checkedout_item_attr_hash[1]
    	item_attr = checkedout_item_attr[:item_attributes]
    	enddate = Date.new(checkedout_item_attr["enddate(1i)"].to_i, checkedout_item_attr["enddate(2i)"].to_i, checkedout_item_attr["enddate(3i)"].to_i)
    	item = Item.find(item_attr[:id])
    	checkedout = CheckedoutItem.new(:item_id => item.id, :startdate => DateTime.now, :enddate => enddate, :status => 0)
    	checkedout.item = item
    	checkedout
    end

    @student = Student.find_by_uin(params[:uin]) || Student.new(params[:checkout][:student_attributes])
    @items = Item.find_all_by_id(params[:item_ids])
    @item = Item.where(:id => params[:item_id]).first
    @checkout = Checkout.new
    @checkout.student = @student
    @checkout.checkedout_items = @checkedout_items
  end
  
  # POST /add_dates
  def add_dates
    @student = Student.find_by_uin(params[:uin]) || Student.new(params[:student])
    @item = Item.where(:id => params[:item_id]).first
    @checkedout_item = CheckedoutItem.new
    @checkedout_item.item = @item
    @items = Item.find_all_by_id(params[:item_ids])
    @checkedout_items = @items.collect do |item| 
    	checkedout = CheckedoutItem.new
    	checkedout.item_id = item.id;
    	checkedout.item = item
    	checkedout
    end
    @checkout = Checkout.new
    @checkout.student = @student
    @checkout.checkedout_items = @checkedout_items
  end
  
  # POST /add_items
  def add_items
  	@student = Student.find_by_uin(params[:uin]) || Student.new(:firstname => params[:firstname], :lastname => params[:lastname], :email => params[:email], :phonenumber => params[:phonenumber], :uin => params[:uin])
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

  # POST /checkouts
  # POST /checkouts.json
  def create
    @student = Student.find_by_uin(params[:uin]) || Student.create(params[:checkout][:student_attributes])
    @checkout = Checkout.create(:student_id => @student.id, :status => 0)
    @checkout.student = @student
    @checkedout_items = params[:checkout][:checkedout_items_attributes].collect do |checkedout_item_attr_hash|
    	checkedout_item_attr = checkedout_item_attr_hash[1]
    	item_attr = checkedout_item_attr[:item_attributes]
    	enddate = Date.new(checkedout_item_attr["enddate(1i)"].to_i, checkedout_item_attr["enddate(2i)"].to_i, checkedout_item_attr["enddate(3i)"].to_i)
    	item = Item.find(item_attr[:id])
    	checkedout = CheckedoutItem.create(:checkout_id => @checkout.id, :item_id => item.id, :startdate => DateTime.now, :enddate => enddate, :status => 0)
    	checkedout.item = item
    	checkedout
    end

    respond_to do |format|
      if @checkout.save!
        format.html { redirect_to @checkout, notice: 'Checkout was successfully created.' }
        format.json { render json: @checkout, status: :created, location: @checkout }
      else
        format.html { render action: "new" }
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

    params[:item_ids].each do |item|
    	@checkout.checkedout_items.each do |coi|
    		if(coi.item_id == item.to_i)
    			coi.update_attribute('status', 1)
    		end
    	end
    end
    
    respond_to do |format|
      #if @checkout.update_attributes(params[:checkout])
        format.html { redirect_to @checkout, notice: 'Checkout was successfully updated.' }
        format.json { head :no_content }
      #else
      #  format.html { render action: "edit" }
      #  format.json { render json: @checkout.errors, status: :unprocessable_entity }
      #end
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
