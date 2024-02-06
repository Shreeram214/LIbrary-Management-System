using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LMStstem.Models
{
    public class BookModel
    {
        public int BookID { get; set; }
        public string Title { get; set; }
        public string Author { get; set; }
        public string ISBN { get; set; }
        public int Quantity { get; set; }
    }
    public class BookTransactionModel
    {
        public int TransactionID { get; set; }
        public int BookID { get; set; }
        public int UserID { get; set; }
        public DateTime IssueDate { get; set; }
        public DateTime? ReturnDate { get; set; }
        public DateTime? DueDate { get; set; }
        public bool IsReissued { get; set; }
    }


}