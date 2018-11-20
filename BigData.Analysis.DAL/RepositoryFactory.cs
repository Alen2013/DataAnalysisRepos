using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BigData.Analysis.IDAL;

namespace BigData.Analysis.DAL
{
    public class RepositoryFactory
    {
        public static IUserInfoRepository UserInfoRepository
        {
            get { return new UserInfoRepository(); }
        }

        public static IRoleRepository RoleRepository
        {
            get { return new RoleRepository(); }
        }
    }
}
