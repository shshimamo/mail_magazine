class MailMagazine

  # units = {key: OpenStruct, key: OpenStruct, ...}
  attr_accessor :units

  def initialize
    @units = {}
  end

  def add_unit(key:, unit:)
    units[key] = unit
  end

  # メルマガに入っている全アイテムを取り出す。重複判定に必要なため。
  def all_items
    units.values.inject([]) {|all, unit| all.concat(unit.items)}
  end

  def send_mail(user)
    p "#{user.name}におすすめのアイテム"
    units.each do |key, unit|
      p unit[:title]
      unit.items.each { |item| p item }
    end
  end
end
