require './mail_magazine_builder'
require './new_arrival_unit_factory'

class PatternAMailMagazineBuilder
  extend Forwardable

  def_delegators :@mail_magazine_builder, :add_units_to_mail_magazine, :mail_magazine

  def initialize
    @mail_magazine_builder = MailMagazineBuilder.new(unit_factories: unit_factories)
  end

  def unit_factories
    [
      { unit_factory_class: NewArrivalUnitFactory, post_args: { something: '新着!'} }
    ]
  end
end
