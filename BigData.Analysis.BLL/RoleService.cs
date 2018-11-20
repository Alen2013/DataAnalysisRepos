using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BigData.Analysis.Model;
using BigData.Analysis.IBLL;

namespace BigData.Analysis.BLL
{
    public partial class RoleService:BaseService<Role>, IRoleService
    {
        //public override void SetCurrentRepository()
        //{
        //    // CurrentRepository = DAL.RepositoryFactory.RoleRepository;
        //    CurrentRepository = _DbSession.RoleRepository; 
        //        }
    }
}
