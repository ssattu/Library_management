module BooksHelper
		def price(book)
		book.present? ? "  ₹ #{book.price}.00"  :""
	end
end
