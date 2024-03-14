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

        #region Add new Book
        public ActionResult AddNewBook()
        {
            try
            {
                return View();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        [HttpPost]
        public ActionResult AddNewBook(BookModel model)
        {
            try
            {
                var AddedBook = _booksDAL.AddNewBook(model);
                if(AddedBook != null)
                {
                    TempData["Message"] = "Added Succefully.";
                    return View("Index", new {area= "librarians" });
                }
                TempData["ErrorMessage"] = "There is an error while adding book please contact Admin!";
                return View();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public JsonResult CheckBook(string booktitle) {
            var result = _booksDAL.CheckDuplicate(booktitle);
            return Json(result, JsonRequestBehavior.AllowGet);
        }
        #endregion
        #region Borrow Book
        public ActionResult BorrowBook(string BookId,string Title)
        {
            try
            {
                var BookDetails = new BookTransactionModel();
                DateTime currentDate = DateTime.Now;
                BookDetails.BookID = Convert.ToInt32(BookId);
                BookDetails.Title = Title;
                BookDetails.IssueDate = currentDate;
                BookDetails.ReturnDate = currentDate.AddDays(15);
                return View(BookDetails);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        [HttpPost]
        public ActionResult BorrowBook(BookTransactionModel model)
        {
            try
            {
                var IssueBookStatus = _booksDAL.BorroweBook(model);
                if (IssueBookStatus != null)
                {
                    TempData["Message"] = "Borrowed Succefully.";
                    return RedirectToAction("Index","Home", new { area = "librarians" });
                }
                TempData["ErrorMessage"] = "There is an error while Borrow book please contact Admin!";
                return View(model);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public JsonResult CheckUser(string UserId)
        {
            var result = _booksDAL.CheckUser(UserId);
            return Json(result, JsonRequestBehavior.AllowGet);
        }
        public ActionResult ReturnBook(string BookId, string Title)
        {
            try
            {
                var BookDetails = new BookTransactionModel();
                DateTime currentDate = DateTime.Now;
                BookDetails.BookID = Convert.ToInt32(BookId);
                BookDetails.Title = Title;
                BookDetails.IssueDate = currentDate;
                BookDetails.ReturnDate = currentDate.AddDays(15);
                return View(BookDetails);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        [HttpPost]
        public ActionResult ReturnBook(BookTransactionModel model)
        {
            try
            {
                var IssueBookStatus = _booksDAL.ReturnBook(model);
                if (IssueBookStatus != null)
                {
                    TempData["Message"] = "Returned Succefully.";
                    return RedirectToAction("Index", "Home", new { area = "librarians" });
                }
                TempData["ErrorMessage"] = "There is an error while Return book please contact Admin!";
                return View(model);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public JsonResult CheckUserReturn(string UserId, string BookId)
        {
            var result = _booksDAL.CheckUserReturn(UserId, BookId);
            var esponse = new
            {
                data = result
            };
            return Json(esponse, JsonRequestBehavior.AllowGet);
        }
        #endregion
        #region ReIsuue Book
        public ActionResult ReIssueBook(string BookId, string Title)
        {
            try
            {
                var BookDetails = new BookTransactionModel();
                DateTime currentDate = DateTime.Now;
                BookDetails.BookID = Convert.ToInt32(BookId);
                BookDetails.Title = Title;
                BookDetails.IssueDate = currentDate;
                BookDetails.ReturnDate = currentDate.AddDays(15);
                return View(BookDetails);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        [HttpPost]
        public ActionResult ReIssueBook(BookTransactionModel model)
        {
            try
            {
                var IssueBookStatus = _booksDAL.ReIssueBook(model);
                if (IssueBookStatus != null)
                {
                    TempData["Message"] = "ReIssued Succefully.";
                    return RedirectToAction("Index", "Home", new { area = "librarians" });
                }
                TempData["ErrorMessage"] = "There is an error while Return book please contact Admin!";
                return View(model);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public JsonResult CheckUserReIssuebook(string UserId, string BookId)
        {
            var result = _booksDAL.CheckUserReIssue(UserId, BookId);
            var esponse = new
            {
                data = result
            };
            return Json(esponse, JsonRequestBehavior.AllowGet);
        }
        #endregion
    }
}