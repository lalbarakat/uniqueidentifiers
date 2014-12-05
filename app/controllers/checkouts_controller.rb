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
    @checkout = Checkout.new
    @students = Student.all()
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
    @students = Student.all()
    @uins = @students.collect { |student| student.uin }
    @firstnames = @students.collect { |student| student.firstname }
    @lastnames = @students.collect { |student| student.lastname }
    @emails = @students.collect { |student| student.email }
    @phones = @students.collect { |student| student.phonenumber }
  end
  
  # POST /review
  def review
    #@student = Student.find_by_uin(params[:uin]) || 
    #		Student.create(:firstname => params[:firstname], :lastname => params[:lastname], :email => params[:email], :phonenumber => params[:phonenumber], :uin => params[:uin])
    #params[:checkout].delete :student
    @checkout = Checkout.new(params[:checkout])
    #@checkout.student = @student
  end

  # POST /checkouts
  # POST /checkouts.json
  def create
    @student = Student.find_by_uin(params[:uin]) || 
    		Student.create(:firstname => params[:firstname], :lastname => params[:lastname], :email => params[:email], :phonenumber => params[:phonenumber], :uin => params[:uin])
    @checkout = Checkout.new(params[:checkout])
    @checkout.student = @student

    respond_to do |format|
      if @checkout.save
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
