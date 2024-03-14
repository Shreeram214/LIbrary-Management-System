using LMStstem.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LMStstem.Areas.Student.Controllers
{
    public class HomeController : Controller
    {
        BooksDAL _booksDAL = new BooksDAL();
        // GET: Student/Home
        public ActionResult Index()
        {
            var BookList = _booksDAL.GetBooks();
            return View(BookList);
        }
    }
}