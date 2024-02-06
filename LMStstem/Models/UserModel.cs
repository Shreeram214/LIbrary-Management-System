using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LMStstem.Models
{
    public class UserModel
    {
        public int UserID { get; set; }
        public string Username { get; set; }
        public string UserEmail { get; set; }
        public string UserPhoneNo { get; set; }
        public string UserPassword { get; set; }
        public string ConfirmPassword { get; set; }
        public int UserRole { get; set; } // Staff, Student, Librarian
    }
    public class FineModel
    {
        public int FineID { get; set; }
        public int TransactionID { get; set; }
        public decimal FineAmount { get; set; }
        public bool IsPaid { get; set; }
        public virtual BookTransactionModel BookTransaction { get; set; }
    }
    
    public class UserRoles
    {
        public int RoleId { get; set; }
        public string Role { get; set; }
    }

}