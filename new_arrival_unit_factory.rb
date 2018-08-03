require './unit_factory_functionable'

class NewArrivalUnitFactory
  include UnitFactoryFunctionable

  attr_reader :something

  #
  # 必要に応じてフックメソッドをoverrideする
  #
  def post_initialize(args)
    @something = args[:something]
  end

  #
  # テンプレートメソッド実装
  #
  def title
    '新着アイテム'
  end

  def items
    # exclude_items を使って既にメルマガに入っているアイテムは除くようにする
    ["item_A [#{something}]", "item_B [#{something}]"]
  end

end
