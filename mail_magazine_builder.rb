require './mail_magazine'

class MailMagazineBuilder
  attr_reader :unit_factories, :mail_magazine

  #
  # 依存度を下げるためにオブジェクトを注入する
  #
  def initialize(unit_factories:)
    @unit_factories = unit_factories
    @mail_magazine = MailMagazine.new
  end

  #
  # モジュールで定義した key, prepare をダックタイプ
  #
  def add_units_to_mail_magazine
    unit_factories.each do |hash|
      unit_factory_class = hash[:unit_factory_class]
      post_args = hash[:post_args]
      unit_builder = unit_factory_class.new(mail_magazine: mail_magazine, post_args: post_args)
      mail_magazine.add_unit(key: unit_builder.key, unit: unit_builder.prepare)
    end
  end
end

