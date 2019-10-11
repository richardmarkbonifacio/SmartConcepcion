﻿using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
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

        #region Accounts and Community
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

        public DataTable UserCreateUpdate(string cnstr, long?ID, string email, string firstname, string middlename, string lastname,
            string suffix, string contactno, long brgyID, DateTime birthday,long? createdby,bool isIndigent, bool isSenior, bool isPWD, bool is4ps)
        {
            try
            {
                result_Dt = new DataTable("User Create Update");
                OpenCn(ref cn, cnstr);
                cmd = new SqlCommand("[User_CreateUpdate]", cn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@ID", SqlDbType.BigInt).Value = ID;
                cmd.Parameters.Add("@email", SqlDbType.VarChar).Value = email;
                cmd.Parameters.Add("@firstname", SqlDbType.VarChar).Value = firstname;
                cmd.Parameters.Add("@middlename", SqlDbType.VarChar).Value = middlename;
                cmd.Parameters.Add("@lastname", SqlDbType.VarChar).Value = lastname;
                cmd.Parameters.Add("@suffix", SqlDbType.VarChar).Value = suffix;
                cmd.Parameters.Add("@contactno", SqlDbType.VarChar).Value = contactno;
                cmd.Parameters.Add("@birthday", SqlDbType.Date).Value = birthday;
                cmd.Parameters.Add("@brgyID", SqlDbType.BigInt).Value = brgyID;
                cmd.Parameters.Add("@isIndigent", SqlDbType.Bit).Value = isIndigent;
                cmd.Parameters.Add("@isSenior", SqlDbType.Bit).Value = isSenior;
                cmd.Parameters.Add("@isPWD", SqlDbType.Bit).Value = isPWD;
                cmd.Parameters.Add("@is4ps", SqlDbType.Bit).Value = is4ps;


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

        public DataTable getUserPaging(string cnstr, int pagesize, int pageno,string search, long? brgyID)
        {
            try
            {
                result_Dt = new DataTable("User Paging Get");
                OpenCn(ref cn, cnstr);
                cmd = new SqlCommand("[User_paging_get]", cn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@PageSize", SqlDbType.Int).Value = pagesize;
                cmd.Parameters.Add("@PageNumber", SqlDbType.Int).Value = pageno;
                cmd.Parameters.Add("@brgyID", SqlDbType.BigInt).Value = brgyID;
                cmd.Parameters.Add("@search", SqlDbType.VarChar).Value = search;

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

        public DataTable getUser_Details(string cnstr, long ID)
        {
            try
            {
                result_Dt = new DataTable("User Details");
                OpenCn(ref cn, cnstr);
                cmd = new SqlCommand("[User_detail_get]", cn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@ID", SqlDbType.BigInt).Value = ID;

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

        public DataTable getAnnouncementsInfo(string cnstr, long ID)
        {
            try
            {
                result_Dt = new DataTable("Announcement Information");
                OpenCn(ref cn, cnstr);
                cmd = new SqlCommand("[Announcement_information_get]", cn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@ID", SqlDbType.Int).Value = ID;

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

        #region Incident Report

        public DataTable getIncidentReport(string cnstr, int pagesize, int pageno)
        {
            try
            {
                result_Dt = new DataTable("Incident Report");
                OpenCn(ref cn, cnstr);
                cmd = new SqlCommand("[Incident_Report_paging_get]", cn);
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

                
            }


            return result_Dt;
        }
        public DataTable setIncidentReport(string cnstr,long? ID, string title,
            string incident_details, string letter_content, 
            long? complainant, long? accused, string complainantName, string accusedName,
            DateTime incident_date, DateTime confrontaion_date, string incident_location,
            string remarks, string status, long createdby)
        {
            try
            {
                result_Dt = new DataTable("Incident Report Set");
                OpenCn(ref cn, cnstr);
                cmd = new SqlCommand("[Incident_Report_set]", cn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@ID", SqlDbType.VarChar).Value = ID;
                cmd.Parameters.Add("@title", SqlDbType.VarChar).Value = title;
                cmd.Parameters.Add("@incident_details", SqlDbType.VarChar).Value = incident_details;
                cmd.Parameters.Add("@incident_location", SqlDbType.VarChar).Value = incident_location;
                cmd.Parameters.Add("@letter_content", SqlDbType.VarChar).Value = letter_content;
                cmd.Parameters.Add("@incidentdate", SqlDbType.DateTime).Value = incident_date;
                cmd.Parameters.Add("@confrontation_date", SqlDbType.DateTime).Value = confrontaion_date;

                cmd.Parameters.Add("@remarks", SqlDbType.VarChar).Value = remarks;
                cmd.Parameters.Add("@status", SqlDbType.VarChar).Value = status;
                cmd.Parameters.Add("@complainantID", SqlDbType.BigInt).Value = complainant;
                cmd.Parameters.Add("@accusedID", SqlDbType.BigInt).Value = accused;
                cmd.Parameters.Add("@complainantName", SqlDbType.VarChar).Value = complainantName;
                cmd.Parameters.Add("@accusedName", SqlDbType.VarChar).Value = accusedName;
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

        public DataTable getIncidentReport_Details(string cnstr, long ID)
        {
            try
            {
                result_Dt = new DataTable("Incident Report Details");
                OpenCn(ref cn, cnstr);
                cmd = new SqlCommand("[Incident_Report_details_get]", cn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@ID", SqlDbType.BigInt).Value = ID;

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

        #region Brgy Officials
        public DataTable getBrgyOfficial(string cnstr, long brgyID)
        {
            try
            {
                result_Dt = new DataTable("Brgy Officials");
                OpenCn(ref cn, cnstr);
                cmd = new SqlCommand("[Brgy_official_get]", cn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@brgyID", SqlDbType.BigInt).Value = brgyID;

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