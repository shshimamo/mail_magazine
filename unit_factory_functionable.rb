module UnitFactoryFunctionable
  attr_reader :mail_magazine, :exclude_items

  #
  # メッセージとは「受け手を信頼し送り手が望むことを頼むもの」なのでmail_magazineを渡すとmail_magazineに既に入っているものは除いてunitを作ってくれるのが理想
  # superは使わずにフックメソッド(post_initialize)で拡張できる余地を残す
  #
  def initialize(mail_magazine:, post_args:)
    @mail_magazine = mail_magazine
    @exclude_items = mail_magazine.all_items
    post_initialize(post_args)
  end

  #
  # 共通の「ユニットを用意(prepare)」という処理は抽象コード。
  # テンプレートメソッド(title, items)を使ってinclude元で具体化する。
  #
  def prepare
    # Arrayよりもできるだけ構造化データを使うと変更がしやすくなる
    OpenStruct.new({title: title, items: items})
  end

  def key
    self.class.name.to_sym
  end

  private

  #
  # フックメソッド
  #
  def post_initialize(args)
    nil
  end

  #
  # テンプレートメソッド
  #
  def title
    ''
  end

  def items
    []
  end
end
