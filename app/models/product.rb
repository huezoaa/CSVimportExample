# class Product < ActiveRecord::Base

#   require 'csv'

#   def self.import(file)
#     CSV.foreach(file.path, headers: true) do |row|

#       product_hash = row.to_hash #exclude the price field
#       product  = Product.where(id: product_hash["id"])

#       if product.count == 1
#         product.first.update_attributes(product_hash)
#       else
#         Product.create!(product_hash)
#       end  # end if

#     end # end CSV.foreach
#   end # end self.import(file)

# end # end class



#This file is a copy of the Model from my app where a CSV is imported.  With headers...
# I modified it to not use headers and instead use a "fields" hash as a guide

class Product < ActiveRecord::Base

  require 'csv'

  def self.import(file)
    CSV.foreach(file.path, headers: false) do |row|

      fields = {id: 0,
          name: 1,
          quantity: 2,
          price: 3,
          }


      product_hash = {}

      fields.each {|key, value|
        product_hash["#{key}"] = row[value]
      }

      product  = Product.where(id: product_hash["id"])

      # Walter said to use the function:  ".first_or_create" instead of the logic below.

      if product.count == 1
        product.first.update_attributes(product_hash)
      else
        Product.create!(product_hash)
      end  # end if


    end # end CSV.foreach
  end # end self.import(file)

end # end class
