using System;
using System.Collections.Generic;
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
        public string Get(int id)
        {
            return "value";
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