  //引进TT模板的命名空间
//using System.Data.Objects;
using BigData.Analysis.Model;

namespace BigData.Analysis.IDAL
{
	//在这里需要一个for循环来遍历数据库中所有的表放置在下面即可，这样就实现了所有的表对应的仓储显示出来了。
		public partial interface  BadInfoRepository : IBaseRepository<BadInfo>
		{
			
		}
		public partial interface  MachineOutputRepository : IBaseRepository<MachineOutput>
		{
			
		}
		public partial interface  RoleRepository : IBaseRepository<Role>
		{
			
		}
		public partial interface  UserInfoRepository : IBaseRepository<UserInfo>
		{
			
		}

}