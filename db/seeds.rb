# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.delete_all

peach_family = ["Edgar", "Martin", "Nereyda", "Jovita", "Eduardo", "Henry", "Denisse", "Jamilett", "Miley"]
passwords = ["boba", "yoyo", "peach", "street", "popular", "crazy", "penguin", "sure", "cole"]

peach_family.each_with_index do |member, index|
  User.create(name: member, chosen: false, family: Family.first, password: passwords[index])
end

martin = User.find_by(name: "Martin")
edgar = User.find_by(name: "Edgar")

# martin.update(giftee_id: edgar.id)

# edgar.update(chosen: true)

peach_fam_db = User.where(family_id: 1)


# iterate through family members
# assign them a giftee_id
  # if giftee_id given is yourself, recieve another giftee_id
  # set chosen to false

def generateRandomMember(members_count)
  rand(members_count)
end



peach_fam_db.each do |peach|
  found = false
  while !found do
    randomPeach = peach_fam_db[generateRandomMember(peach_fam_db.length)]

    if peach.id == martin.id
      martin.update(giftee_id: edgar.id)
      edgar.update(chosen: true)
      found = true
    elsif peach.id != randomPeach.id && randomPeach.chosen == false && randomPeach.id != edgar.id
      peach.update(giftee_id: randomPeach.id)
      randomPeach.update(chosen: true)

      found = true
    end
  end
end