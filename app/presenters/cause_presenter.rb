class CausePresenter
  def default
    Cause.column_names.map(&:to_sym)
  end
end
