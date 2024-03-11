using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.InteropServices;
using System.Web;
using LMStstem.Models;

namespace LMStstem.DataAccess
{
    public class BooksDAL
    {
        public static SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBConn"].ConnectionString.ToString());
        public List<BookModel> GetBooks()
        {
            try
            {
                List<BookModel> BookList = new List<BookModel>();
                SqlCommand cmd = new SqlCommand("BooksSP", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@StatementType", "GetBookList");
                con.Open();
                DataTable dt = new DataTable();
                dt.Load(cmd.ExecuteReader());
                con.Close();
                if (dt.Rows.Count > 0)
                {
                    foreach (DataRow dr in dt.Rows)
                    {
                        BookModel book = new BookModel();
                        book.BookID = Convert.ToInt32(dr["BookID"]);
                        book.Quantity = Convert.ToInt32(dr["Quantity"]);
                        book.Title = dr["Title"] as string;
                        book.Author = dr["Author"] as string;
                        book.ISBN = dr["ISBN"] as string;
                        BookList.Add(book);
                    }
                    return BookList;
                }
                return null;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public List<BookTransactionModel> BookTransactions()
        {
            try
            {
                List<BookTransactionModel> TransactionsList = new List<BookTransactionModel>();
                SqlCommand cmd = new SqlCommand("BooksSP", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@StatementType", "GetBooksTrans");
                con.Open();
                DataTable dt = new DataTable();
                dt.Load(cmd.ExecuteReader());
                con.Close();
                if (dt.Rows.Count > 0)
                {
                    foreach (DataRow dr in dt.Rows)
                    {
                        BookTransactionModel Transaction = new BookTransactionModel();
                        Transaction.TransactionID = Convert.ToInt32(dr["RoleID"]);
                        Transaction.BookID = Convert.ToInt32(dr["RoleID"]);
                        Transaction.UserID = Convert.ToInt32(dr["RoleID"]);
                        Transaction.IssueDate = dr["RoleName"] != System.DBNull.Value ? Convert.ToDateTime(dr["RoleName"]) : new DateTime(1,1,1990);
                        Transaction.ReturnDate = dr["RoleName"] != System.DBNull.Value ? Convert.ToDateTime(dr["RoleName"]) : new DateTime(1, 1, 1990);
                        Transaction.IsReissued = dr["RoleName"] != System.DBNull.Value ? Convert.ToBoolean(dr["RoleName"]) : false;
                        TransactionsList.Add(Transaction);
                    }
                    return TransactionsList;
                }
                return null;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public string BorroweBook(BookTransactionModel model)
        {
            try
            {
                SqlCommand cmd = new SqlCommand("BooksSP", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@StatementType", "BorroweBook");
                cmd.Parameters.AddWithValue("@BookId", model.BookID);
                cmd.Parameters.AddWithValue("@UserID", model.UserID);
                con.Open();
                DataTable dt = new DataTable();
                dt.Load(cmd.ExecuteReader());
                con.Close();
                if (dt.Rows.Count > 0)
                {
                    string response = dt.Rows[0]["ID"].ToString();
                    return response;
                }
                return null;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public string ReturnBook(BookTransactionModel model)
        {
            try
            {
                SqlCommand cmd = new SqlCommand("BooksSP", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@StatementType", "ReturnBook");
                cmd.Parameters.AddWithValue("@StatementType", model.TransactionID);
                cmd.Parameters.AddWithValue("@StatementType", model.BookID);
                cmd.Parameters.AddWithValue("@StatementType", model.UserID);
                con.Open();
                DataTable dt = new DataTable();
                dt.Load(cmd.ExecuteReader());
                con.Close();
                string response = dt.Rows[0]["Result"].ToString();
                return response;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public string ReIssueBook(BookTransactionModel model)
        {
            try
            {
                SqlCommand cmd = new SqlCommand("BooksSP", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@StatementType", "ReIssueBook");
                cmd.Parameters.AddWithValue("@StatementType", model.TransactionID);
                cmd.Parameters.AddWithValue("@StatementType", model.BookID);
                cmd.Parameters.AddWithValue("@StatementType", model.UserID);
                con.Open();
                DataTable dt = new DataTable();
                dt.Load(cmd.ExecuteReader());
                con.Close();
                string response = dt.Rows[0]["Result"].ToString();
                return response;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public string AddNewBook(BookModel model)
        {
            try
            {
                SqlCommand cmd = new SqlCommand("BooksSP", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@StatementType", "AddNewBook");
                cmd.Parameters.AddWithValue("@BookTitle", model.Title);
                cmd.Parameters.AddWithValue("@BookAuthor", model.Author);
                cmd.Parameters.AddWithValue("@ISBN", model.ISBN);
                cmd.Parameters.AddWithValue("@Quantity", model.Quantity);
                con.Open();
                DataTable dt = new DataTable();
                dt.Load(cmd.ExecuteReader());
                con.Close();
                if(dt.Rows.Count > 0)
                {
                    string response = dt.Rows[0]["ID"].ToString();
                    return response;
                }
                return null;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public bool CheckDuplicate(string Title)
        {
            try
            {
                SqlCommand cmd = new SqlCommand("BooksSP", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@StatementType", "CheckDuplicate");
                cmd.Parameters.AddWithValue("@BookTitle", Title);
                con.Open();
                DataTable dt = new DataTable();
                dt.Load(cmd.ExecuteReader());
                con.Close();
                if (dt.Rows.Count > 0)
                {
                    //string response = dt.Rows[0]["ID"].ToString();
                    return true;
                }
                return false;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public bool CheckUser(string UserId)
        {
            try
            {
                SqlCommand cmd = new SqlCommand("AccountSP", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@StatementType", "CheckUser");
                cmd.Parameters.AddWithValue("@UserID", UserId);
                con.Open();
                DataTable dt = new DataTable();
                dt.Load(cmd.ExecuteReader());
                con.Close();
                if (dt.Rows.Count > 0)
                {
                    return false;
                }
                return true;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


    }
}