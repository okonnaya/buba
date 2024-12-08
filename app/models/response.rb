class Response < ApplicationRecord
    # Валидация email
    validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "Введите корректный email" }
  
    # Валидация сообщения
    validates :message, presence: true, length: { maximum: 200, message: "Сообщение не может быть длиннее 200 символов" }
    validate :no_profanity
  
    private
  
    def no_profanity
        bad_words = %w[
            хуйня говно ебеня ебать бля хуй ссанина дерьмо гавно дурость еб выебать херь херня хренотень пиздец пизда манда бебра
            блядь бл@дь бл*дь бл%дь
            сука сук@ су*ка с%ка
            хуй ху@й ху*й ху%й хуи х%и ху* ху@
            пизда пизд@ пизд* пиз% п%зда
            ебать еб@ть еб*ть еб%ать ёбать ёб@ть ёб*ть ёб%ать ёбну ёбн@
            мудак мудил муд@к му*дак му%дак
            дурак дур@к ду*рак ду%рак дурочка дур@чка дур*чка
            чмо чм@ чм* чм%
            козел козёл козл@ козл* козл%
            урод ур@д ур*д ур%д уродина урод@
            говно говн@ говн* гов%но гавн@ гавн* гавн%
            сволочь свол@чь свол*чь свол%чь
            мразь мр@зь мр*зь мр%зь
            ублюдок ублюд@к ублюд*к ублюд%к
            падла пад@ла пад*ла пад%ла
            шлюха шлюх@ шлю*ха шлю%ха шл@ха шл*ха
            fuck f*ck f@ck f%ck
            shit sh*t sh@t sh%t
            bitch b*tch b@tch b%tch
            ass a*s a@s a%s asshole assh@le assh*le
            bastard bast@rd bast*rd bast%rd
            damn d*mn d@mn d%mn
            crap cr@p cr*p cr%p
            hell h@ll h*ll h%ll
            slut sl@t sl*t sl%t
            dick d@ck d*ck d%ck
            pussy puss@ puss* puss%
            cunt c@nt c*nt c%nt
            cock c@ck c*ck c%ck
            whore wh@re wh*re  wh%re
            jerk j@rk j*rk j%rk
            retard ret@rd ret*rd r ret%rd
            moron mor@n mor*n m mor%n
            idiot idi@t idi*t i idi%t
          ]
          
      if bad_words.any? { |word| message.to_s.downcase.include?(word) }
        errors.add(:message, "Сообщение содержит недопустимые выражения")
      end
    end
  end
  