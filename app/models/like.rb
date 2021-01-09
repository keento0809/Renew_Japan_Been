class Like < ApplicationRecord
    # Likeから見てUserはひとつ存在する
    # belongs_toは単数形なのでモデルを単数形の:userと書く
end
