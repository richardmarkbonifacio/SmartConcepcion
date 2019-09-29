using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;

namespace SmartConcepcion.Class
{
    public class clsQuery
    {
        #region "Variables"

        TextInfo textInfo = new CultureInfo("en-US", false).TextInfo;
        DataSet result_DS = null;
        DataTable result_Dt = null;

        SqlConnection cn;
        SqlCommand cmd;
        SqlDataAdapter da;

        Boolean bres;
        #endregion

        #region "SQLConnection"
        private void OpenCn(ref SqlConnection cn, string cnstr)
        {

            string[] cn_name = cnstr.Split('~');

            
            cn = new SqlConnection(readConStr(cnstr));

            try
            {
                cn.Open();
            }
            catch (Exception ex)
            {

            }
        }
        #endregion

        #region "Standard methods"

        protected static string readConStr(string name)
        {
            return ConfigurationManager.ConnectionStrings[name].ConnectionString;
        }

        public string Crypt(string input)
        {

            string strTempChar = "", newValue = "";


            for (int i = 0; i < input.Length; i++)
            {

                if (Convert.ToInt32(Convert.ToChar(input.Substring(i, 1))) < 128)
                {
                    strTempChar = Convert.ToString(Convert.ToInt32(Convert.ToChar(input.Substring(i, 1))) + 128);
                }
                else if (Convert.ToInt32(Convert.ToChar(input.Substring(i, 1))) > 128)
                {
                    strTempChar = Convert.ToString(Convert.ToInt32(Convert.ToChar(input.Substring(i, 1))) - 128);
                }
                newValue += Convert.ToChar(Convert.ToInt32(strTempChar)).ToString();

            }

            return newValue;
        }

        DataTable JsonToTable(string json_string)
        {
            DataTable dt_tmp;
            dt_tmp = JsonConvert.DeserializeObject<DataTable>(json_string);
            return dt_tmp;
        }

        #endregion

        #region Accounts
        public DataTable postSignIn(string cnstr, long userid, string userpass)
        {
            try
            {
                result_Dt = new DataTable("Account Profile");
                OpenCn(ref cn, cnstr);
                cmd = new SqlCommand("[SignIn]", cn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@userid", SqlDbType.BigInt).Value = userid;
                cmd.Parameters.Add("@userpass", SqlDbType.VarChar).Value = userpass;

                da = new SqlDataAdapter(cmd);
                using (cn)
                {
                    using (cmd)
                    {
                        using (da)
                        {
                            da.Fill(result_Dt);
                        }
                    }
                }
            }
            catch (Exception)
            {

                throw;
            }
            

            return result_Dt;
        }

        public DataTable postSignUp(string cnstr, string email, string firstname, string middlename, string lastname,
            string suffix, string contactno, string userpass,long brgyID,DateTime birthday)
        {
            try
            {
                result_Dt = new DataTable("Account Register");
                OpenCn(ref cn, cnstr);
                cmd = new SqlCommand("[SignUp]", cn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@email", SqlDbType.VarChar).Value = email;
                cmd.Parameters.Add("@firstname", SqlDbType.VarChar).Value = firstname;
                cmd.Parameters.Add("@middlename", SqlDbType.VarChar).Value = middlename;
                cmd.Parameters.Add("@lastname", SqlDbType.VarChar).Value = lastname;
                cmd.Parameters.Add("@suffix", SqlDbType.VarChar).Value = suffix;
                cmd.Parameters.Add("@contactno", SqlDbType.VarChar).Value = contactno;
                cmd.Parameters.Add("@birthday", SqlDbType.Date).Value = birthday;
                cmd.Parameters.Add("@brgyID", SqlDbType.BigInt).Value = brgyID;
                cmd.Parameters.Add("@userpass", SqlDbType.BigInt).Value = userpass;
                

                da = new SqlDataAdapter(cmd);
                using (cn)
                {
                    using (cmd)
                    {
                        using (da)
                        {
                            da.Fill(result_Dt);
                        }
                    }
                }
            }
            catch (Exception)
            {

                throw;
            }


            return result_Dt;
        }
        #endregion

        #region Announcements
        public DataTable getTopAnnoucements(string cnstr)
        {
            try
            {
                result_Dt = new DataTable("Top Announcement");
                OpenCn(ref cn, cnstr);
                cmd = new SqlCommand("[Announce_top_get]", cn);
                cmd.CommandType = CommandType.StoredProcedure;

                da = new SqlDataAdapter(cmd);
                using (cn)
                {
                    using (cmd)
                    {
                        using (da)
                        {
                            da.Fill(result_Dt);
                        }
                    }
                }
            }
            catch (Exception)
            {

                throw;
            }


            return result_Dt;
        }

        public DataTable getAnnouncements(string cnstr, int pagesize, int pageno)
        {
            try
            {
                result_Dt = new DataTable("Account Profile");
                OpenCn(ref cn, cnstr);
                cmd = new SqlCommand("[Announce_paging_get]", cn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@PageSize", SqlDbType.Int).Value = pagesize;
                cmd.Parameters.Add("@PageNumber", SqlDbType.Int).Value = pageno;

                da = new SqlDataAdapter(cmd);
                using (cn)
                {
                    using (cmd)
                    {
                        using (da)
                        {
                            da.Fill(result_Dt);
                        }
                    }
                }
            }
            catch (Exception)
            {

                throw;
            }


            return result_Dt;
        }

        public DataTable setAnnouncements(string cnstr, string title, string subtitle, string content, DateTime publisheddate, 
            long? typeID,  string banner_ext, long createdby)
        {
            try
            {
                result_Dt = new DataTable("Announcement Set");
                OpenCn(ref cn, cnstr);
                cmd = new SqlCommand("[Announcement_Set]", cn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@title", SqlDbType.VarChar).Value = title;
                cmd.Parameters.Add("@subtitle", SqlDbType.VarChar).Value = subtitle;
                cmd.Parameters.Add("@body_content", SqlDbType.VarChar).Value = content;
                cmd.Parameters.Add("@publisheddate", SqlDbType.Date).Value = publisheddate;
                cmd.Parameters.Add("@typeID", SqlDbType.BigInt).Value = typeID;
                
                cmd.Parameters.Add("@banner_extension", SqlDbType.VarChar).Value = banner_ext;
                cmd.Parameters.Add("@createdby", SqlDbType.BigInt).Value = createdby;


                da = new SqlDataAdapter(cmd);
                using (cn)
                {
                    using (cmd)
                    {
                        using (da)
                        {
                            da.Fill(result_Dt);
                        }
                    }
                }
            }
            catch (Exception)
            {

                throw;
            }


            return result_Dt;
        }
        #endregion
    }
}