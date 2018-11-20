using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BigData.Analysis.IDAL
{
    public interface IDbSession
    {
        //每个表对应的实体仓储对象
        IRoleRepository RoleRepository { get; }
        IUserInfoRepository UserInfoRepository{ get; }

        //将当前应用程序跟数据库的会话内所有实体的变化更新数据库
        int SaveChanges();
        int ExcuteSql(string strSql, DbParameter[] parameters);
    }
}
