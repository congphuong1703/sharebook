using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace sharebook.model
{
    public class Users
    {
        private int id;
        private String email;
        private String password;
        private String name;
        private Boolean status;
        private Boolean verify;
        private int role;

        public int Id { get => id; set => id = value; }
        public string Email { get => email; set => email = value; }
        public string Password { get => password; set => password = value; }
        public string Name { get => name; set => name = value; }
        public bool Status { get => status; set => status = value; }
        public bool Verify { get => verify; set => verify = value; }
        public int Role { get => role; set => role = value; }
    }
}