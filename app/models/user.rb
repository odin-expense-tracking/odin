# == Schema Information
#
# Table name: users
#
#  id                         :bigint           not null, primary key
#  email                      :string           default(""), not null
#  encrypted_password         :string           default(""), not null
#  reset_password_token       :string
#  reset_password_sent_at     :datetime
#  remember_created_at        :datetime
#  sign_in_count              :integer          default(0), not null
#  current_sign_in_at         :datetime
#  last_sign_in_at            :datetime
#  current_sign_in_ip         :inet
#  last_sign_in_ip            :inet
#  confirmation_token         :string
#  confirmed_at               :datetime
#  confirmation_sent_at       :datetime
#  unconfirmed_email          :string
#  failed_attempts            :integer          default(0), not null
#  unlock_token               :string
#  locked_at                  :datetime
#  first_name                 :string
#  last_name                  :string
#  announcements_last_read_at :datetime
#  admin                      :boolean          default(FALSE)
#  timezone                   :string
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#  invitation_token           :string
#  invitation_created_at      :datetime
#  invitation_sent_at         :datetime
#  invitation_accepted_at     :datetime
#  invitation_limit           :integer
#  invited_by_type            :string
#  invited_by_id              :bigint
#  invitations_count          :integer          default(0)
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable, :invitable, :omniauthable, :masqueradable

  has_person_name
  has_many :services

end
