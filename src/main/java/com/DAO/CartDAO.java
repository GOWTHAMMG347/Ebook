package com.DAO;

import java.util.List;

import com.entity.BookDts;
import com.entity.Cart;

public interface CartDAO {

	public boolean addCart(Cart c);
	
	public List<Cart> getBookByUser(int userid);
	
	public boolean deleteBook(int bid,int uid);
}
