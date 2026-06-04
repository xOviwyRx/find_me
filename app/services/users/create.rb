module Users
  class Create < Actor
    input :brand
    input :attributes

    output :user

    def call
      self.user = User.new(attributes)
      user.user_brands.build(brand: brand)

      fail!(error: "User could not be created") unless user.save
    end
  end
end
