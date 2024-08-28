package com.DAO;

import java.util.List;

import com.entity.BookDts;

public interface BookDAO {
	
	public boolean addBooks(BookDts b);
	
	public List<BookDts> getAllBooks();
	
	public BookDts getBookbyId(int id);
	
	public boolean updateEditBooks(BookDts b);
	
	public boolean deleteBooks(int id);
	
	public List<BookDts> getNewBook();
	
	public List<BookDts> getRecentBooks();
	
	public List<BookDts> getOldBooks();
	
	public List<BookDts> getAllRecentBook();
	
	public List<BookDts> getAllNewBook();
	
	public List<BookDts> getAllOldBook();

	
}
