class NotesController < AuthController
  before_action :set_note, only: [:edit, :update, :show, :destroy]
  before_action :check_owner, only: [:edit, :update, :show, :destroy]

  def index
    @search = params[:search]
    
    query_params = params.merge(user: current_user)

    @notes = NotesQuery.new(Note, query_params).perform_search
  end

  def new
    @note = Note.new
  end

  def edit; end

  def create
    @note = Note.new(note_params)

    if @note.save
      flash[:notice] = 'Note was successfully created'
      redirect_to note_path(@note)
    else
      render 'new'
    end
  end

  def update
    if @note.update(note_params)
      flash[:notice] = 'Note was successfully updated'
      redirect_to notes_path
    else
      render 'edit'
    end
  end

  def show; end

  def destroy
    @note.destroy
    flash[:notice] = 'Note was successfully deleted'
    redirect_to notes_path
  end

  private

  def set_note
    @note = Note.find(params[:id])
  end

  def note_params
    parse_date_taken

    params.require(:note).permit(:title, :content, :date_taken, :priority, :search).merge(user: current_user)
  end

  def parse_date_taken
    unless params['note']['date_taken'].blank?
      params['note']['date_taken'] = Time.strptime(params['note']['date_taken'], '%m/%d/%Y %I:%M %p').to_s
    end
  end

  def check_owner
    unless @note.user_id == current_user.id
      flash[:error] = 'Oops! You are not the owner of this note'
      redirect_to notes_path
    end
  end
end
