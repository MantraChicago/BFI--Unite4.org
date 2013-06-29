class CampaignPresenter
  def base
    [
      :id,
      :cause_id,
      :need_id,
      :start_date,
      :end_date,
      :active,
      :desired_state,
      :current_state,
      :percent_complete,
      {
        attribute: :need,
        presenter: :default
      }
    ]
  end

  def default
    base
  end
end
