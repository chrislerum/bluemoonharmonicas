class Order < ActiveRecord::Base
  validates :cart_id, presence: true
  belongs_to :cart
  belongs_to :user
  has_many :transactions, class_name: 'OrderTransaction'
  attr_accessible :express_payer_id,
                  :express_token,
                  :ip_address,

                  :first_name,
                  :last_name,
                  :email,
                  :address
  attr_accessor :total

  serialize :address

  def price_in_cents
    (price_with_shipping*100).round
  end

  def price_with_shipping
    cart.total_price# + shipping_price
  end

  def order_number
    id + 4123
  end

  def self.calculate_shipping_price(num_items, opts)
    if opts[:domestic]
      4.95 + 1 * (num_items - 1)
    else
      10 + 1 * (num_items - 1)
    end
  end

  def shipping_price(opts = nil)
    if in_usa? || (opts && opts[:domestic] == true)
      Order.calculate_shipping_price(cart.number_of_items, domestic: true)
    else
      Order.calculate_shipping_price(cart.number_of_items, domestic: false)
    end
  end

  def in_usa?
    # Everything is lowercased for case insensitivity purposes
    list_of_states = YAML::load_file(File.join(File.dirname(File.expand_path(__FILE__)), 'states.yml'))
    self.address && self.address["StateOrProvince"] && list_of_states.include?(self.address["StateOrProvince"].downcase)
  end

  def purchase
    response = process_purchase
    transactions.create!(:action => "purchase", :amount => price_in_cents, :response => response)
    if response.success?
      cart.update_inventory
      cart.update_attribute(:purchased_at, Time.now)
    end
    response.success?
  end

  def express_token=(token)
    write_attribute(:express_token, token)
    if new_record? && !token.blank?
      details = GATEWAY.details_for(token)
      self.express_payer_id = details.payer_id
      self.first_name =       details.params["first_name"]
      self.last_name =        details.params["last_name"]
      self.email =            details.params["payer"]
      self.address =          details.params["PaymentDetails"]["ShipToAddress"]
      self.total =            details.params["order_total"]
    end
  end

  private
    def process_purchase
      GATEWAY.purchase(price_in_cents, express_purchase_options)
    end

    def express_purchase_options
    {
      :ip => ip_address,
      :token => express_token,
      :payer_id => express_payer_id
    }
    end

end
