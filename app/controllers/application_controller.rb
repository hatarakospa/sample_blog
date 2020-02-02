class ApplicationController < ActionController::Base

  #フォーム送信時エラーになったのでCSRF保護を無効にする
  #https://qiita.com/rh_/items/7a0258374af0727e5343
  protect_from_forgery with: :null_session

end