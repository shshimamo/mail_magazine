require 'ostruct'
require 'forwardable'
require './pattern_a_mail_magazine_builder'

mail_magazine_builder = PatternAMailMagazineBuilder.new
mail_magazine_builder.add_units_to_mail_magazine
mail_magazine = mail_magazine_builder.mail_magazine
user = OpenStruct.new({name: 'taro'}) # 本当はUserクラス
mail_magazine.send_mail(user)
