using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using ModuleWeb.Models;

namespace ModuleWeb.Controllers
{
    [RoutePrefix("api")]
    public class CategoryController : ApiController
    {
        [Route("Category")]
        [HttpGet]
        public dynamic Category()
        {
            using (var db = new ModuleWebEntities())
            {
                var parents = db.Categories.Where(x => x.ParentId != null).Select(x => x.ParentId).Distinct().ToList();
                var parentWithoutChildren = db.Categories.ToList().Where(x => x.ParentId == null && db.Categories.ToList().Where(y => y.ParentId == x.ParentId).Count() == 0).Select(x => x.Id).Distinct().ToList();

                var allParentsId = new List<string>();
                for (int i = 0; i < parents.Count; i++)
                {
                    allParentsId.Add(parents[i]);
                }

                for (int i = 0; i < parentWithoutChildren.Count; i++)
                {
                    allParentsId.Add(parentWithoutChildren[i]);
                }

                var categoryList = new List<CategoryGetDTO>();
                for (int i = 0; i < allParentsId.Count; i++)
                {
                    var parentID = allParentsId[i];
                    var parentName = db.Categories.Where(x => x.Id == parentID).Select(x => x.Name).FirstOrDefault();

                    var children = db.Categories.Where(x => x.ParentId == parentID).Select(x => new
                    { 
                        x.Id,
                        x.Name
                    }).ToList();

                    var childrenList = new List<CategoryChildrenParentDTO>();
                    for (int j = 0; j < children.Count; j++)
                    {
                        childrenList.Add(new CategoryChildrenParentDTO
                        { 
                            id = children[j].Id,
                            name = children[j].Name
                        });
                    }

                    categoryList.Add(new CategoryGetDTO
                    {
                        id = parentID,
                        name = parentName,
                        children = childrenList
                    });
                }

                return categoryList;
            }
        }

        [Route("api/Category")]
        [HttpPost]
        public dynamic PostCategory(PostCategoryDTO postCategory)
        {
            using (var db = new ModuleWebEntities())
            {
                if(postCategory.parentID != null)
                {
                    if(db.Categories.Where(x => x.ParentId == postCategory.parentID).Count() == 0)
                    {
                        return new MessageDTO()
                        {
                            message = "Parent doesn't exist"
                        };
                    }
                }

                db.Categories.Add(new Category
                {
                    Id = postCategory.id,
                    Name = postCategory.name,
                    ParentId = postCategory.parentID
                });
                db.SaveChanges();

                var parentInput = new CategoryChildrenParentDTO();
                if(postCategory.parentID == null)
                {
                    parentInput = null;
                }
                else
                {
                    parentInput.id = postCategory.parentID;
                    parentInput.name = db.Categories.Where(x => x.ParentId == postCategory.parentID).Select(x => x.Name).FirstOrDefault();
                }

                var result = new ResultPostCategory
                {
                    id = postCategory.id,
                    name = postCategory.name,
                    parent = parentInput
                };

                return new MessageDTO()
                {
                    message = result.ToString()
                };
            }
        }
    }

    public class CategoryGetDTO
    {
        public string id { get; set; }
        public string name { get; set; }
        public List<CategoryChildrenParentDTO> children { get; set; }
    }

    public class CategoryChildrenParentDTO
    {
        public string id { get; set; }
        public string name { get; set; }
    }

    public class PostCategoryDTO
    {
        public string id { get; set; }
        public string name { get; set; }
        public string parentID { get; set; }
    }

    public class ResultPostCategory
    {
        public string id { get; set; }
        public string name { get; set; }
        public CategoryChildrenParentDTO parent { get; set; }
    }
}
