class Coupon < ApplicationRecord
  validates_presence_of :status,
                        :code,
                        :name,
                        :perc_disc,
                        :dollar_disc,
                        :kind
                        :merchant_id

  belongs_to :merchant
  has_many :invoices
  enum status: [:activated, :deactivated]
  enum kind: [:perc, :dollar]
end