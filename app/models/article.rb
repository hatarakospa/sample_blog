class Article < ApplicationRecord
    validates :title, presence: true, length: { minimum: 5 }

    #未削除ユーザスコープ
    scope :active, -> { where(delete_flg: false) }

    has_many :categories_articles
    has_many :categories, through: :categories_articles
end
