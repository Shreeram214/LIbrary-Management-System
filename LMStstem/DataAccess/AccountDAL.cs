using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using LMStstem.Models;

namespace LMStstem.DataAccess
{
    public class AccountDAL
    {
        public static SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBConn"].ConnectionString.ToString());
        public UserModel GetUser(UserModel model)
        {
            try
            {
                SqlCommand cmd = new SqlCommand("AccountSP", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@StatementType", "VerifyUser");
                cmd.Parameters.AddWithValue("@UserEmail", model.UserEmail);
                cmd.Parameters.AddWithValue("@UserPassword", model.UserPassword);
                cmd.Parameters.AddWithValue("@UserRole", model.UserRole);
                con.Open();
                DataTable dt = new DataTable();
                dt.Load(cmd.ExecuteReader());
                con.Close();
                if (dt.Rows.Count > 0)
                {
                    UserModel user = new UserModel();
                    user.UserID = Convert.ToInt32(dt.Rows[0]["UserID"]);
                    user.UserEmail = dt.Rows[0]["UserEmail"] != System.DBNull.Value ? Convert.ToString(dt.Rows[0]["UserEmail"]) : "";
                    user.Username = dt.Rows[0]["Username"] != System.DBNull.Value ? Convert.ToString(dt.Rows[0]["Username"]) : "";
                    user.UserPhoneNo = dt.Rows[0]["UserPhone"] != System.DBNull.Value ? Convert.ToString(dt.Rows[0]["UserPhone"]) : "";
                    user.UserRole = dt.Rows[0]["UserRoleId"] != System.DBNull.Value ? Convert.ToInt32(dt.Rows[0]["UserRoleId"]) : 0;
                    return user;
                }
                return null;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public int SignUp(UserModel model)
        {
            try
            {
                SqlCommand cmd = new SqlCommand("AccountSP", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@StatementType", "SignUp");
                cmd.Parameters.AddWithValue("@Username", model.Username);
                cmd.Parameters.AddWithValue("@UserEmail", model.UserEmail);
                cmd.Parameters.AddWithValue("@UserPassword", model.UserPassword);
                cmd.Parameters.AddWithValue("@UserRole", model.UserRole);
                cmd.Parameters.AddWithValue("@UserPhoneNo", model.UserPhoneNo);
                con.Open();
                DataTable dt = new DataTable();
                dt.Load(cmd.ExecuteReader());
                con.Close();
                if (dt.Rows.Count > 0)
                {
                    int UserID = Convert.ToInt32(dt.Rows[0]["UserID"]);
                    return UserID;
                }
                return 0;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public List<UserRoles> GetUserRoles()
        {
            try
            {
                SqlCommand cmd = new SqlCommand("AccountSP", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@StatementType", "GetUserRoles");
                DataTable dt = new DataTable();
                con.Open();
                dt.Load(cmd.ExecuteReader());
                con.Close();
                List<UserRoles> userRoles = new List<UserRoles>();
                if (dt.Rows.Count > 0)
                {
                    foreach(DataRow dr in dt.Rows)
                    {
                        UserRoles roles = new UserRoles();
                        roles.RoleId = Convert.ToInt32(dr["RoleID"]);
                        roles.Role = dr["RoleName"] != System.DBNull.Value ? Convert.ToString(dr["RoleName"]) : "";
                        userRoles.Add(roles);
                    }
                }
                return userRoles;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}