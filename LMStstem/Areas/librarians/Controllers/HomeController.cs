using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using LMStstem.DataAccess;
using LMStstem.Models;

namespace LMStstem.Areas.librarians.Controllers
{
    public class HomeController : Controller
    {
        BooksDAL _booksDAL = new BooksDAL();
        // GET: librarians/Home
        public ActionResult Index()
        {
            try
            {
                var BookList = _booksDAL.GetBooks();
                return View(BookList);
            }
            catch (Exception ex) 
            {
                throw ex;
            }
        }

        
    }
}