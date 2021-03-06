class Contact
  attr_reader(:first_name, :last_name, :birth_year, :user_id)
  @@contacts = []

  define_method(:initialize) do |attributes|
    @first_name = attributes.fetch(:first_name)
    @last_name = attributes.fetch(:last_name)
    @birth_year = attributes.fetch(:birth_year)
    @user_id = @@contacts.length().+(1)
  end

  define_singleton_method(:all) do
    @@contacts
  end

  define_method(:save) do
    @@contacts.push(self)
  end
  define_singleton_method(:clear) do
    @@contacts = []
  end

  define_singleton_method(:find) do |identification|
    found_contact = nil
    @@contacts.each() do |contact|
      if contact.user_id().eql?(identification.to_i())
        found_contact = contact
      end
    end
    found_contact
  end


end
