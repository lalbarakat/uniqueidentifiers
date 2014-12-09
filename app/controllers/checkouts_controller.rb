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
    @student = Student.find_by_uin(params[:uin]) || Student.new(params[:student])
    @item = Item.where(:id => params[:item_id]).first
    @checkedout_item = CheckedoutItem.new(:enddate => params[:enddate])
    @checkedout_item.item = @item
    #@checkout = Checkout.new
    #@checkout.update_attributes(params[:checkout])
    #@checkout = Checkout.new
    #@student = Student.new(params[:checkout][:student_attributes])
    #params[:checkout][:checkedout_items_attributes].each_with_index do |coi_hash, index|
    #	coi_attrs = coi_hash[1];
    #	item_attrs = coi_attrs[:item_attributes]
    #	item = Item.find_by_id item_attrs[:id]
    #	coi_attrs.delete :item_attributes
    #	coi = CheckedoutItem.new(coi_attrs)
    #	coi.item = item
    #	@checkout.checkedout_items << coi
    #end
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
	#@checkout = Checkout.new(params[:checkout])
	@checkout.student = @student
	@checkout.checkedout_items.build
	@checkout.checkedout_items[0].build_item
  end

  # POST /checkouts
  # POST /checkouts.json
  def create
    #@student = Student.find_by_uin(params[:uin]) || 
    #		Student.create(:firstname => params[:firstname], :lastname => params[:lastname], :email => params[:email], :phonenumber => params[:phonenumber], :uin => params[:uin])
    @checkout = Checkout.new(params[:checkout])
    #@checkout.student = @student

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

  # PUT /checkouts/1
  # PUT /checkouts/1.json
  # CHECKIN
  def update
    @checkout = Checkout.find(params[:id])

    respond_to do |format|
      if @checkout.update_attributes(params[:checkout])
        format.html { redirect_to @checkout, notice: 'Checkout was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @checkout.errors, status: :unprocessable_entity }
      end
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
