using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using ModuleWeb.Models;

namespace ModuleWeb.Controllers
{
    [RoutePrefix("Identity")]
    public class AccountController : ApiController
    {
        [Route("Account/Login")]
        [HttpPost]
        public dynamic Login(LoginDTO loginDTO)
        {
            using (var db = new ModuleWebEntities())
            {
                var cekPassword = db.Users.Where(x => x.Email == loginDTO.email).Select(x => new
                { 
                    x.Password,
                    x.Role
                }).ToArray();
                if(cekPassword.Length > 0)
                {
                    if(loginDTO.password == cekPassword[0].Password)
                    {
                        return new MessageDTO()
                        {
                            message = "Success-" + cekPassword[0].Role
                        };
                    }
                    else
                    {
                        return new MessageDTO()
                        {
                            message = "Login invalid"
                        };
                    }
                }
                else
                {
                    return new MessageDTO()
                    {
                        message = "Login invalid"
                    };
                }
            }
        }

        [Route("Account/Register")]
        [HttpPost]
        public dynamic Register(RegisterDTO registerDTO)
        {
            using (var db = new ModuleWebEntities())
            {
                if(registerDTO.password.Length > 6)
                {
                    if(!registerDTO.password.All(char.IsLetterOrDigit))
                    {
                        db.Users.Add(new User
                        {
                            Id = registerDTO.name + (db.Users.Where(x => x.Id.Contains(registerDTO.name)).Count() + 1),
                            Name = registerDTO.name,
                            Email = registerDTO.email,
                            Password = registerDTO.password,
                            Role = "User"
                        });
                        db.SaveChanges();

                        return new MessageDTO()
                        {
                            message = "Success"
                        };
                    }
                    else
                    {
                        return new MessageDTO()
                        {
                            message = "Password must consists more than 6 characters and at least 1 non-alphanumeric character"
                        };
                    }
                }
                else
                {
                    return new MessageDTO()
                    {
                        message = "Password must consists more than 6 characters and at least 1 non-alphanumeric character"
                    };
                }
            }
        }
    }

    public class LoginDTO
    {
        public string email { get; set; }
        public string password { get; set; }
    }

    public class RegisterDTO
    {
        public string name { get; set; }
        public string email { get; set; }
        public string password { get; set; }
    }
}
