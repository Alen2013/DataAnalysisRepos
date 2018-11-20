using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BigData.Analysis.Model;
using BigData.Analysis.IDAL;

namespace BigData.Analysis.DAL
{
    //继承基类的CRUD
    public partial class RoleRepository : BaseRepository<Role>, IRoleRepository
    {
    }
}
