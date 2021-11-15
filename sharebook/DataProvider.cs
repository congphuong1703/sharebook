using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace sharebook
{
    public class DataProvider
    {
        private static DataProvider instance;

        public static DataProvider getInstance
        {
            get { if (instance == null) instance = new DataProvider(); return DataProvider.instance; }
            private set { DataProvider.instance = value; }
        }

        private DataProvider() { }

        public MySqlConnection connectionSQL()
        {
            string constr = ConfigurationManager.ConnectionStrings["connectSQL"].ToString();
            MySqlConnection conn = new MySqlConnection(constr);
            conn.Open();

            return conn;
        }

        // somthing change here
        public DataTable ExecuteQuery(string query, object[] parameter = null)
        {
            DataTable data = new DataTable();

            using (MySqlConnection connection = this.connectionSQL())
            {

                MySqlCommand command = new MySqlCommand(query, connection);

                if (parameter != null)
                {
                    string[] listPara = query.Split(' ');
                    int i = 0;
                    foreach (string item in listPara)
                    {
                        if (item.Contains('@'))
                        {
                            command.Parameters.AddWithValue(item, parameter[i]);
                            i++;
                        }
                    }
                }

                MySqlDataAdapter adapter = new MySqlDataAdapter(command);

                adapter.Fill(data);

                connection.Close();
            }
            return data;
        }

        // số dòng trả ra thành công
        public int ExecuteNonQuery(string query, object[] parameter = null)
        {
            int data = 0;

            using (MySqlConnection connection = this.connectionSQL())
            {
                MySqlCommand command = new MySqlCommand(query, connection);

                if (parameter != null)
                {
                    string[] listPara = query.Split(' ');
                    int i = 0;
                    foreach (string item in listPara)
                    {
                        if (item.Contains('@'))
                        {
                            command.Parameters.AddWithValue(item, parameter[i]);
                            i++;
                        }
                    }
                }

                data = command.ExecuteNonQuery(); // trả ra số dòng thành công

                connection.Close();
            }
            return data;
        }

        // đếm số lượng trả ra
        public object ExecuteScalar(string query, object[] parameter = null)
        {
            object data = 0;

            using (MySqlConnection connection = this.connectionSQL())
            {
                MySqlCommand command = new MySqlCommand(query, connection);

                if (parameter != null)
                {
                    string[] listPara = query.Split(' ');
                    int i = 0;
                    foreach (string item in listPara)
                    {
                        if (item.Contains('@'))
                        {
                            command.Parameters.AddWithValue(item, parameter[i]);
                            i++;
                        }
                    }
                }

                data = command.ExecuteScalar();

                connection.Close();
            }
            return data;

        }

        public DataTable ExecuteQuery(string storeProcedure, Dictionary<string, Object> map)
        {
            DataTable data = new DataTable();


            //tạo kết nối tới database
            // using khi mà kết thúc khối lệnh thì dữ liệu sẽ tự giải phóng
            using (MySqlConnection connection = this.connectionSQL())
            {
                // chạy câu thực thi câu truy vấn query trên data connection
                MySqlCommand cmd = new MySqlCommand(storeProcedure, connection);
                cmd.CommandType = CommandType.StoredProcedure;
                foreach (var key in map.Keys)
                {
                    cmd.Parameters.AddWithValue(key, map[key]);
                }
                MySqlDataAdapter adapter = new MySqlDataAdapter();
                adapter.SelectCommand = cmd;

                adapter.Fill(data);

                connection.Close();
            }
            return data;
        }
        public MySqlDataReader ExecuteQueryReader(string storeProcedure, Dictionary<string, Object> map)
        {

            MySqlDataReader rdr;
            //tạo kết nối tới database
            // using khi mà kết thúc khối lệnh thì dữ liệu sẽ tự giải phóng
            using (MySqlConnection connection = this.connectionSQL())
            {
                // chạy câu thực thi câu truy vấn query trên data connection
                MySqlCommand cmd = new MySqlCommand(storeProcedure, connection);
                cmd.CommandType = CommandType.StoredProcedure;
                foreach (var key in map.Keys)
                {
                    cmd.Parameters.AddWithValue(key, map[key]);
                }
                rdr = cmd.ExecuteReader();
                connection.Close();
            }
            return rdr;
        }

        // số dòng trả ra thành công
        public int ExecuteNonQuery(string storeProcedure, Dictionary<string, Object> map)
        {
            int data = 0;

            using (MySqlConnection connection = this.connectionSQL())
            {
                MySqlCommand cmd = new MySqlCommand(storeProcedure, connection);

                cmd.CommandType = CommandType.StoredProcedure;
                foreach (var key in map.Keys)
                {
                    cmd.Parameters.AddWithValue(key, map[key]);
                }

                MySqlDataAdapter adapter = new MySqlDataAdapter(cmd);

                data = cmd.ExecuteNonQuery(); // trả ra số dòng thành công

                connection.Close();
            }
            return data;
        }

        // đếm số lượng trả ra
        public object ExecuteScalar(string storeProcedure, Dictionary<string, Object> map)
        {
            object data = 0;


            using (MySqlConnection connection = this.connectionSQL())
            {
                MySqlCommand cmd = new MySqlCommand(storeProcedure, connection);
                cmd.CommandType = CommandType.StoredProcedure;

                foreach (var key in map.Keys)
                {
                    cmd.Parameters.AddWithValue(key, map[key]);
                }

                MySqlDataAdapter adapter = new MySqlDataAdapter(cmd);


                data = cmd.ExecuteScalar();

                connection.Close();
            }
            return data;
        }
    }
}