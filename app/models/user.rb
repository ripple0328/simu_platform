# encoding: utf-8
class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation
  has_secure_password
  
  validates :name, :presence => true,
                   :uniqueness => { :case_sensitive => false },
                   :length => { :maximum => 20 }

  email_regex = /\A[\w+\-.]+@zte\.com\.cn/i
  validates :email, :presence => true,
                    :uniqueness => { :case_sensitive => false },
                    :format => {:with => email_regex, :message => '用中兴邮箱注册'}

 
  validates :password, :on => :create, 
                       :confirmation => true,
                       :presence => true,
                       :length => {:within => 6..20,           
                        :too_short => "密码必须大于%{count}位数",
                        :too_long => "密码必须小于%{count}位"}
  validates :password_confirmation, :presence => true


#  validates password_digest
end
