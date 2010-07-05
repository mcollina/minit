class Link
  include Mongoid::Document
  field :url, :type => String
  field :short_form, :type => String
  
  validates_presence_of :url
  validates_format_of :url, :with => URI::regexp(%w(http https))
  
  before_create :fill_short_form
  
  protected
  def fill_short_form
    if short_form.nil?
      self.short_form = Encoder.encode(Sequence.next(:link_sequence))
    end
  end
end
