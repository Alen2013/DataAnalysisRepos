  //引进TT模板的命名空间
using System;
using BigData.Analysis.IDAL;

namespace BigData.Analysis.DAL
{
    public class DbSession : IDbSession
    {
        //一次跟数据库交互的会话，封装了所有仓储的属性，根据DbSession可以拿到仓储的属性
        public IDAL.IBadInfoRepository BadInfoRepository
		{
		    get { return new BadInfoRepository(); }
		}
		public IDAL.IMachineOutputRepository MachineOutputRepository
		{
		    get { return new MachineOutputRepository(); }
		}
		public IDAL.IRoleRepository RoleRepository
		{
		    get { return new RoleRepository(); }
		}
		public IDAL.IUserInfoRepository UserInfoRepository
		{
		    get { return new UserInfoRepository(); }
		}
	
        //代表：当前应用程序跟数据库的绘画内所有的实体的变化，更新会数据库

        public int SaveChanges()
        {
            //调用EF上下文的SaveChanges方法
            return DAL.EFContextFactory.GetCurrentDbContext().SaveChanges();
        }

        public int ExcuteSql(string strSql, System.Data.Common.DbParameter[] parameters)
        {
            //return DAL.EFContextFactory.GetCurrentDbContext().ExecuteFunction(strSql, parameters);
            throw new NotImplementedException();
        }
    }
}
