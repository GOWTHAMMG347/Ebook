package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.BookDts;
import com.mysql.cj.protocol.Resultset;

public class BookDAOImpl implements BookDAO {

	public BookDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	private Connection conn;
	
	public boolean addBooks(BookDts b) {
		boolean f=false;
		try {
			String sql="insert into book_dts(bookname,author,price,bookcategory,status,photo,email) values(?,?,?,?,?,?,?)";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, b.getBookname());
			ps.setString(2, b.getAuthor());
			ps.setString(3, b.getPrice());
			ps.setString(4, b.getBookcategory());
			ps.setString(5, b.getStatus());
			ps.setString(6, b.getPhoto());
			ps.setString(7, b.getEmail());
			
			int i=ps.executeUpdate();
			if(i==1) {
				f=true;
			}
		} catch (Exception e) {
					e.printStackTrace();
					}
		return f;
	}

	public List<BookDts> getAllBooks() {
		List<BookDts> list=new ArrayList<BookDts>();
		BookDts b=null;
		try {
			String sql="select * from book_dts";
			PreparedStatement ps=conn.prepareStatement(sql);
			
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				b=new BookDts();
				b.setBookid(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookcategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public BookDts getBookbyId(int id) {
		BookDts b=null;
		try {
			String sql="select * from book_dts where bookid=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, id);
			
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				b=new BookDts();
				b.setBookid(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookcategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return b;
	}



	public boolean updateEditBooks(BookDts b) {
		boolean f=false;
		try {
			String sql="update book_dts set bookname=?,author=?,price=?,status=? where bookid=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1,b.getBookname());
			ps.setString(2,b.getAuthor());
			ps.setString(3,b.getStatus());
			ps.setString(4,b.getStatus());
			ps.setInt(5, b.getBookid());
			int i=ps.executeUpdate();
			if (i==1) {
				f=true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		
	}
		return f;

	}

	public boolean deleteBooks(int id) {
		boolean f=false;
		try {
			String sql="delete from book_dts where bookid=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, id);
			int i=ps.executeUpdate();
			if (i==1) {
				f=true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public List<BookDts> getNewBook() {
		List<BookDts> list=new ArrayList<BookDts>();
		BookDts b=null;
		try {
			String sql="select * from book_dts  where bookcategory=? and status=? order by bookid DESC";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, "New");
			ps.setString(2, "Active");
			ResultSet rs=ps.executeQuery();
			int i=1;
			while (rs.next() && i<=4) {
				b=new BookDts();
				b.setBookid(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookcategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				i++;
			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		
		return list;
	}

	public List<BookDts> getRecentBooks() {
		List<BookDts> list=new ArrayList<BookDts>();
		BookDts b=null;
		try {
			String sql="select * from book_dts  where status=? order by bookid DESC";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, "Active");
			ResultSet rs=ps.executeQuery();
			int i=1;
			while (rs.next() && i<=4) {
				b=new BookDts();
				b.setBookid(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookcategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				i++;
			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		
		return list;
	}

	public List<BookDts> getOldBooks() {
		List<BookDts> list=new ArrayList<BookDts>();
		BookDts b=null;
		try {
			String sql="select * from book_dts  where bookcategory=? and status=? order by bookid DESC";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, "Old");
			ps.setString(2, "Active");
			ResultSet rs=ps.executeQuery();
			while (rs.next() ) {
				b=new BookDts();
				b.setBookid(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookcategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				
			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		
		return list;
	}

	public List<BookDts> getAllRecentBook() {
		List<BookDts> list=new ArrayList<BookDts>();
		BookDts b=null;
		try {
			String sql="select * from book_dts  where status=? order by bookid DESC";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, "Active");
			ResultSet rs=ps.executeQuery();
			while (rs.next() ) {
				b=new BookDts();
				b.setBookid(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookcategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				
			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		
		return list;
	}


	public List<BookDts> getAllNewBook() {
		List<BookDts> list=new ArrayList<BookDts>();
		BookDts b=null;
		try {
			String sql="select * from book_dts  where bookcategory=? and status=? order by bookid DESC";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, "New");
			ps.setString(2, "Active");
			ResultSet rs=ps.executeQuery();
			int i=1;
			while (rs.next() ) {
				b=new BookDts();
				b.setBookid(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookcategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				
			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		
		return list;
	}

	public List<BookDts> getAllOldBook() {
		List<BookDts> list=new ArrayList<BookDts>();
		BookDts b=null;
		try {
			String sql="select * from book_dts  where bookcategory=? and status=? order by bookid DESC";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, "Old");
			ps.setString(2, "Active");
			ResultSet rs=ps.executeQuery();
			while (rs.next() ) {
				b=new BookDts();
				b.setBookid(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookcategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				
			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		
		return list;
	}

		

	
	
	
}


	
