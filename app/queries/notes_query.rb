class NotesQuery
  def initialize(relation, params = {})
    @relation = relation
    @params = params
  end

  def perform_search
    result = @params[:search].blank? ? base : base.search(@params[:search])
    result.page(@params[:page])
  end

  private

  def base
    @relation
      .notes_for_user(@params[:user])
      .order(date_taken: :desc)
  end
end