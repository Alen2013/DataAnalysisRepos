  //引进TT模板的命名空间
//using System.Data.Objects;
using BigData.Analysis.IDAL;
using BigData.Analysis.Model;

namespace BigData.Analysis.DAL
{
	//在这里需要一个for循环来遍历数据库中所有的表放置在下面即可，这样就实现了所有的表对应的仓储显示出来了。
		public partial class  BadInfoRepository : BaseRepository<BadInfo>, IBadInfoRepository
		{

		}
		public partial class  MachineOutputRepository : BaseRepository<MachineOutput>, IMachineOutputRepository
		{

		}
		public partial class  RoleRepository : BaseRepository<Role>, IRoleRepository
		{

		}
		public partial class  UserInfoRepository : BaseRepository<UserInfo>, IUserInfoRepository
		{

		}

}