class CampaignPresenter
  def self.base
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
      :days_to_go,
      {
        attribute: :need,
        presenter: :default
      }
    ]
  end

  def self.cause_profile
    base
  end

  def self.default
    base
  end
end
