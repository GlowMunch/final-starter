class Invoice < ApplicationRecord
  validates_presence_of :status,
                        :customer_id

  belongs_to :customer
  belongs_to :coupon, optional: true
  has_many :transactions
  has_many :invoice_items
  has_many :items, through: :invoice_items
  has_many :merchants, through: :items

  enum status: [:cancelled, :in_progress, :completed]

  def total_revenue
    invoice_items.sum("unit_price * quantity")
  end

  def coupon_discount
    if self.coupon_discount_type == "Percentage"
      p "#{self.coupon_percent_discount_ammount}%"
    else coupon_discount_type == "Dollar"
      p "$#{coupon_dollar_discount_ammount}"
    end
  end

  def coupon_name
    if self.coupon != nil
      self.coupon.name
    else
      nil
    end
  end

  def coupon_discount_type
    if self.coupon != nil
      self.coupon.kind
    else
      nil
    end
  end

  def coupon_dollar_discount_ammount
    self.coupon.dollar_disc
  end

  def coupon_percent_discount_ammount
    self.coupon.perc_disc
  end

  def coupon_discount_applied
    if coupon_discount_type == "Percentage"
      discount = self.coupon_percent_discount_ammount
      percent_discount = 1 - ((discount.to_f)/100)
      (self.total_revenue) * percent_discount
    elsif coupon_discount_type == "Dollar"
      dollar_discount = (total_revenue) - (coupon_dollar_discount_ammount)
        if dollar_discount < 0
          dollar_disccount = 0
        else
          dollar_disccount
        end
    else
      nil
    end
  end
end
