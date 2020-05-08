class Offer < Listing
  belongs_to :provider, class_name: "Person", foreign_key: "person_id"
  belongs_to :service_area, inverse_of: :offers

  scope :unmatched, ->() { includes(:matches_as_provider).references(:matches_as_provider).where("matches.receiver_id IS NULL") }

  def name
    tags.flatten.join(", ")
  end
end
