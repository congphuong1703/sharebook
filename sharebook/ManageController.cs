using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace sharebook
{
    public class ManageController : ApiController
    {
        // GET api/<controller>
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET api/<controller>/5
        public UserModel Get(int id)
        {
            UserModel userModel = new UserModel();
            string getInfoUser = "getInfoUser";
            Dictionary<string, object> map = new Dictionary<string, object> { };
            map.Add("@pUserId", id);
            DataTable dt = DataProvider.getInstance.ExecuteQuery(getInfoUser, map);
            if (dt.Rows.Count > 0)
            {
                userModel.id = Int32.Parse(dt.Rows[0][0].ToString());
                userModel.name = dt.Rows[0][1].ToString();
                userModel.email = dt.Rows[0][2].ToString();
                userModel.role = dt.Rows[0][6].ToString();
                userModel.avatar = dt.Rows[0][3].ToString();
            }
            return userModel;
        }

        // POST api/<controller>
        [ActionName("saveTag")]
        public void Post([FromBody] string value)
        {
            string postTag = "postTag";
            Dictionary<string, object> map = new Dictionary<string, object> { };
            map.Add("@pTag", value);
            DataProvider.getInstance.ExecuteQuery(postTag, map);
        }

        // PUT api/<controller>/5
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE api/<controller>/5
        public void Delete(string id)
        {
            string deleteUserById = "deleteUserById";
            Dictionary<string, object> map = new Dictionary<string, object> { };
            map.Add("@pUserId", id);
            DataProvider.getInstance.ExecuteQuery(deleteUserById, map);
        }
    }
}