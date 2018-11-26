//引进TT模板的命名空间
//using System.Data.Objects;
using BigData.Analysis.DAL;
using BigData.Analysis.IBLL;
using BigData.Analysis.Model;

namespace BigData.Analysis.BLL
{
	//在这里需要一个for循环来遍历数据库中所有的表放置在下面即可，这样就实现了所有的表对应的仓储显示出来了。
		public partial class  BadInfoService : BaseService<BadInfo>, IBadInfoService
		{
		    public override void SetCurrentRepository()
			{
				CurrentRepository = _DbSession.BadInfoRepository;
			}

		}
		public partial class  MachineOutputService : BaseService<MachineOutput>, IMachineOutputService
		{
		    public override void SetCurrentRepository()
			{
				CurrentRepository = _DbSession.MachineOutputRepository;
			}

		}
		public partial class  RoleService : BaseService<Role>, IRoleService
		{
		    public override void SetCurrentRepository()
			{
				CurrentRepository = _DbSession.RoleRepository;
			}

		}
		public partial class  UserInfoService : BaseService<UserInfo>, IUserInfoService
		{
		    public override void SetCurrentRepository()
			{
				CurrentRepository = _DbSession.UserInfoRepository;
			}

		}

}